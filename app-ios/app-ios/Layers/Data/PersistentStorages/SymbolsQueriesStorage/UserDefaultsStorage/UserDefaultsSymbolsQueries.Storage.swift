//
//  UserDefaultsSymbolsQueries.Storage.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

final class UserDefaultsSymbolsQueriesStorage {
    private let maxStorageLimit: Int
    private let recentsSymbolsQueriesKey = "recentsSymbolsQueries"
    private var userDefaults: UserDefaults
    private let backgroundQueue: DispatchQueue = .global(qos: .userInitiated)
    
    init(
        maxStorageLimit: Int,
        userDefaults: UserDefaults = UserDefaults.standard
    ) {
        self.maxStorageLimit = maxStorageLimit
        self.userDefaults = userDefaults
    }

    private func fetchSymbolsQueries() -> [SymbolQuery] {
        if let queriesData = userDefaults.object(forKey: recentsSymbolsQueriesKey) as? Data {
            if let symbolQueryList = try? JSONDecoder().decode(SymbolQueriesListUDS.self, from: queriesData) {
                return symbolQueryList.list.map { $0.toDomain() }
            }
        }
        return []
    }

    private func persist(symbolsQueries: [SymbolQuery]) {
        let encoder = JSONEncoder()
        let symbolQueryUDSs = symbolsQueries.map(SymbolQueryUDS.init)
        if let encoded = try? encoder.encode(SymbolQueriesListUDS(list: symbolQueryUDSs)) {
            userDefaults.set(encoded, forKey: recentsSymbolsQueriesKey)
        }
    }
}

extension UserDefaultsSymbolsQueriesStorage: SymbolsQueriesStorage {
    func fetchRecentsQueries(
        maxCount: Int,
        completion: @escaping (Result<[SymbolQuery], Error>) -> Void
    ) {
        backgroundQueue.async { [weak self] in
            guard let self = self else { return }

            var queries = self.fetchSymbolsQueries()
            queries = queries.count < self.maxStorageLimit ? queries : Array(queries[0..<maxCount])
            completion(.success(queries))
        }
    }

    func saveRecentQuery(
        query: SymbolQuery,
        completion: @escaping (Result<SymbolQuery, Error>) -> Void
    ) {
        backgroundQueue.async { [weak self] in
            guard let self = self else { return }

            var queries = self.fetchSymbolsQueries()
            self.cleanUpQueries(for: query, in: &queries)
            queries.insert(query, at: 0)
            self.persist(symbolsQueries: queries)

            completion(.success(query))
        }
    }
}


// MARK: - Private
extension UserDefaultsSymbolsQueriesStorage {
    private func cleanUpQueries(for query: SymbolQuery, in queries: inout [SymbolQuery]) {
        removeDuplicates(for: query, in: &queries)
        removeQueries(limit: maxStorageLimit - 1, in: &queries)
    }

    private func removeDuplicates(for query: SymbolQuery, in queries: inout [SymbolQuery]) {
        queries = queries.filter { $0 != query }
    }

    private func removeQueries(limit: Int, in queries: inout [SymbolQuery]) {
        queries = queries.count <= limit ? queries : Array(queries[0..<limit])
    }
}
