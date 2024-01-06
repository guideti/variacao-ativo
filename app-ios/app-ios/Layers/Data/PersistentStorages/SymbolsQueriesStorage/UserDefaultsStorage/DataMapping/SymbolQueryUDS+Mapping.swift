//
//  SymbolQueryUDS+Mapping.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

struct SymbolQueriesListUDS: Codable {
    var list: [SymbolQueryUDS]
}

struct SymbolQueryUDS: Codable {
    let query: String
}

extension SymbolQueryUDS {
    init(symbolQuery: SymbolQuery) {
        query = symbolQuery.query
    }
}

extension SymbolQueryUDS {
    func toDomain() -> SymbolQuery {
        return .init(query: query)
    }
}

