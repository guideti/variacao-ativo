//
//  SearchSymbols.UseCase.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

protocol SearchSymbolsUseCase {
    func execute(
        requestValue: SearchSymbolsUseCaseRequestValue,
        cached: @escaping (SymbolsPage) -> Void,
        completion: @escaping (Result<SymbolsPage, Error>) -> Void
    ) -> Cancellable?
}

final class DefaultSearchSymbolsUseCase: SearchSymbolsUseCase {
    private let symbolsRepository: SymbolsRepository
    private let symbolsQueriesRepository: SymbolsQueriesRepository

    init(
        symbolsRepository: SymbolsRepository,
        symbolsQueriesRepository: SymbolsQueriesRepository
    ) {

        self.symbolsRepository = symbolsRepository
        self.symbolsQueriesRepository = symbolsQueriesRepository
    }

    func execute(
        requestValue: SearchSymbolsUseCaseRequestValue,
        cached: @escaping (SymbolsPage) -> Void,
        completion: @escaping (Result<SymbolsPage, Error>) -> Void
    ) -> Cancellable? {
        return symbolsRepository.fetchSymbolsList(
            query: requestValue.query,
            cached: cached,
            completion: { result in
                if case .success = result {
                    self.symbolsQueriesRepository.saveRecentQuery(query: requestValue.query) { _ in }
                }
            completion(result)
        })
    }
}

struct SearchSymbolsUseCaseRequestValue {
    let query: SymbolQuery
}
