//
//  SymbolsQueries.Storage.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

protocol SymbolsQueriesStorage {
    func fetchRecentsQueries(
        maxCount: Int,
        completion: @escaping (Result<[SymbolQuery], Error>) -> Void
    )
    
    func saveRecentQuery(
        query: SymbolQuery,
        completion: @escaping (Result<SymbolQuery, Error>) -> Void
    )
}
