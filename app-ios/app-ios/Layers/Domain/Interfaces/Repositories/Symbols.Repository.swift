//
//  Symbols.Repository.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

protocol SymbolsRepository {
    @discardableResult
    func fetchSymbolsList(
        query: SymbolQuery,
        cached: @escaping (SymbolsPage) -> Void,
        completion: @escaping (Result<SymbolsPage, Error>) -> Void
    ) -> Cancellable?
}
