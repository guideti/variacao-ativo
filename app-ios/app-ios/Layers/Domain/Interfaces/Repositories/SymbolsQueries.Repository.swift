//
//  SymbolsQueries.Repository.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

protocol SymbolsQueriesRepository {
    func fetchRecentsQueries(
        maxCount: Int,
        completion: @escaping (Result<[SymbolQuery], Error>) -> Void
    )
    
    func saveRecentQuery(
        query: SymbolQuery,
        completion: @escaping (Result<SymbolQuery, Error>) -> Void
    )
}
