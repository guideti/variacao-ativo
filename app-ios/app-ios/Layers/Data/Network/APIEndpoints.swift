//
//  APIEndpoints.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

struct APIEndpoints {
    static func getSymbols(with symbolsRequestDTO: SymbolsRequestDTO) -> Endpoint<SymbolsResponseDTO> {
        return Endpoint(
            path: "v1/finance/search",
            method: .get,
            queryParametersEncodable: symbolsRequestDTO
        )
    }
}
