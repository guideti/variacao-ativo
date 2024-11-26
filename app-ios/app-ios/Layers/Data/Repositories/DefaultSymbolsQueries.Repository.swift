//
//  DefaultSymbolsQueries.Repository.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

final class DefaultSymbolsQueriesRepository {
    private let dataTransferService: DataTransferService
    private var symbolsQueriesPersistentStorage: SymbolsQueriesStorage
    
    init(
        dataTransferService: DataTransferService,
        symbolsQueriesPersistentStorage: SymbolsQueriesStorage
    ) {
        self.dataTransferService = dataTransferService
        self.symbolsQueriesPersistentStorage = symbolsQueriesPersistentStorage
    }
}

extension DefaultSymbolsQueriesRepository: SymbolsQueriesRepository {
    func fetchRecentsQueries(
        maxCount: Int,
        completion: @escaping (Result<[SymbolQuery], Error>) -> Void
    ) {
        return symbolsQueriesPersistentStorage.fetchRecentsQueries(
            maxCount: maxCount,
            completion: completion
        )
    }
    
    func saveRecentQuery(
        query: SymbolQuery,
        completion: @escaping (Result<SymbolQuery, Error>) -> Void
    ) {
        symbolsQueriesPersistentStorage.saveRecentQuery(
            query: query,
            completion: completion
        )
    }
}
