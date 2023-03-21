//
//  SymbolsResponseDTO+Mapping.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

// MARK: - Data Transfer Object

struct SymbolsResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case quotes = "quotes"
    }
    let quotes: [SymbolDTO]
}

extension SymbolsResponseDTO {
    struct SymbolDTO: Decodable {
        private enum CodingKeys: String, CodingKey {
            case score
            case longname
            case symbol
        }
        let score: Double
        let longname: String?
        let symbol: String?
    }
}

// MARK: - Mappings to Domain

extension SymbolsResponseDTO {
    func toDomain() -> SymbolsPage {
        return .init(
            quotes: quotes.map { $0.toDomain() }
        )
    }
}

extension SymbolsResponseDTO.SymbolDTO {
    func toDomain() -> Symbol {
        return .init(
            id: Symbol.Identifier(score),
            longname: longname,
            symbol: symbol
        )
    }
}
