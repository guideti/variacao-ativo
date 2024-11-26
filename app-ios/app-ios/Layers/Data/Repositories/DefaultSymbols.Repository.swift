//
//  DefaultSymbols.Repository.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 20/03/23.
//

import Foundation

final class DefaultSymbolsRepository {
    private let dataTransferService: DataTransferService
    private let cache: SymbolsResponseStorage

    init(
        dataTransferService: DataTransferService,
        cache: SymbolsResponseStorage
    ) {
        self.dataTransferService = dataTransferService
        self.cache = cache
    }
}

extension DefaultSymbolsRepository: SymbolsRepository {
    func fetchSymbolsList(
        query: SymbolQuery,
        cached: @escaping (SymbolsPage) -> Void,
        completion: @escaping (Result<SymbolsPage, Error>) -> Void
    ) -> Cancellable? {
        let requestDTO = SymbolsRequestDTO(q: query.query)
        let task = RepositoryTask()

        cache.getResponse(for: requestDTO) { result in
            if case let .success(responseDTO?) = result {
                cached(responseDTO.toDomain())
            }
            
            guard !task.isCancelled else { return }

            let endpoint = APIEndpoints.getSymbols(with: requestDTO)
            task.networkTask = self.dataTransferService.request(with: endpoint) { result in
                switch result {
                case .success(let responseDTO):
                    self.cache.save(response: responseDTO, for: requestDTO)
                    completion(.success(responseDTO.toDomain()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        return task
    }
}
