//
//  SymbolsResponse.Storage.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

protocol SymbolsResponseStorage {
    func getResponse(
        for request: SymbolsRequestDTO,
        completion: @escaping (Result<SymbolsResponseDTO?, Error>) -> Void
    )
    
    func save(response: SymbolsResponseDTO, for requestDto: SymbolsRequestDTO)
}
