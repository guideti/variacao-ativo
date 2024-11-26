//
//  SymbolQueryEntity+Mapping.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation
import CoreData

extension SymbolQueryEntity {
    convenience init(symbolQuery: SymbolQuery, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        query = symbolQuery.query
        createdAt = Date()
    }
}

extension SymbolQueryEntity {
    func toDomain() -> SymbolQuery {
        return .init(query: query ?? "")
    }
}
