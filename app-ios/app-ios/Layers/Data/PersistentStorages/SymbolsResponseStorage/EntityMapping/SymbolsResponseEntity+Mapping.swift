//
//  SymbolsResponseEntity+Mapping.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation
import CoreData

extension SymbolsResponseEntity {
    func toDTO() -> SymbolsResponseDTO {
        return .init(
            quotes: symbols?.allObjects.map { ($0 as! SymbolResponseEntity).toDTO() } ?? []
        )
    }
}

extension SymbolResponseEntity {
    func toDTO() -> SymbolsResponseDTO.SymbolDTO {
        return .init(
            score: Double(id),
            longname: longname,
            symbol: symbol
        )
    }
}

extension SymbolsRequestDTO {
    func toEntity(in context: NSManagedObjectContext) -> SymbolsRequestEntity {
        let entity: SymbolsRequestEntity = .init(context: context)
        entity.query = q
        return entity
    }
}

extension SymbolsResponseDTO {
    func toEntity(in context: NSManagedObjectContext) -> SymbolsResponseEntity {
        let entity: SymbolsResponseEntity = .init(context: context)
        
        quotes.forEach {
            entity.addToSymbols($0.toEntity(in: context))
        }
        
        return entity
    }
}

extension SymbolsResponseDTO.SymbolDTO {
    func toEntity(in context: NSManagedObjectContext) -> SymbolResponseEntity {
        let entity: SymbolResponseEntity = .init(context: context)
        
        entity.id = Int64(score.toInt() ?? 1)
        entity.longname = longname
        entity.symbol = symbol
        
        return entity
    }
}

