//
//  FetchRecentSymbolQueries.UseCase.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

final class FetchRecentSymbolQueriesUseCase: UseCase {
    struct RequestValue {
        let maxCount: Int
    }
    
    typealias ResultValue = (Result<[SymbolQuery], Error>)

    private let requestValue: RequestValue
    private let completion: (ResultValue) -> Void
    private let symbolsQueriesRepository: SymbolsQueriesRepository

    init(
        requestValue: RequestValue,
        completion: @escaping (ResultValue) -> Void,
        symbolsQueriesRepository: SymbolsQueriesRepository
    ) {
        self.requestValue = requestValue
        self.completion = completion
        self.symbolsQueriesRepository = symbolsQueriesRepository
    }
    
    func start() -> Cancellable? {
        symbolsQueriesRepository.fetchRecentsQueries(
            maxCount: requestValue.maxCount,
            completion: completion
        )
        
        return nil
    }
}
