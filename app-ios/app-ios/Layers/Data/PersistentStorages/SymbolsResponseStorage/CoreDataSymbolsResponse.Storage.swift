//
//  CoreDataSymbolsResponse.Storage.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation
import CoreData

final class CoreDataSymbolsResponseStorage {
    private let coreDataStorage: CoreDataStorage

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

    // MARK: - Private
    private func fetchRequest(
        for requestDto: SymbolsRequestDTO
    ) -> NSFetchRequest<SymbolsRequestEntity> {
        let request: NSFetchRequest = SymbolsRequestEntity.fetchRequest()
        request.predicate = NSPredicate(format: "%K = %@", #keyPath(SymbolsRequestEntity.query), requestDto.q)
        return request
    }

    private func deleteResponse(
        for requestDto: SymbolsRequestDTO,
        in context: NSManagedObjectContext
    ) {
        let request = fetchRequest(for: requestDto)

        do {
            if let result = try context.fetch(request).first {
                context.delete(result)
            }
        } catch {
            print(error)
        }
    }
}

extension CoreDataSymbolsResponseStorage: SymbolsResponseStorage {
    func getResponse(
        for requestDto: SymbolsRequestDTO,
        completion: @escaping (Result<SymbolsResponseDTO?, Error>) -> Void
    ) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let fetchRequest = self.fetchRequest(for: requestDto)
                let requestEntity = try context.fetch(fetchRequest).first

                completion(.success(requestEntity?.response?.toDTO()))
            } catch {
                completion(.failure(CoreDataStorageError.readError(error)))
            }
        }
    }

    func save(
        response responseDto: SymbolsResponseDTO,
        for requestDto: SymbolsRequestDTO
    ) {
        coreDataStorage.performBackgroundTask { context in
            do {
                self.deleteResponse(for: requestDto, in: context)

                let requestEntity = requestDto.toEntity(in: context)
                requestEntity.response = responseDto.toEntity(in: context)

                try context.save()
            } catch {
                // TODO: - Log to Crashlytics
                debugPrint("CoreDataSymbolsResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}
