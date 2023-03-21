//
//  SymbolsSceneDIContainer.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import UIKit

final class SymbolsSceneDIContainer: SymbolsSearchFlowCoordinatorDependencies {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies

    // MARK: - Persistent Storage
    lazy var symbolsQueriesStorage: SymbolsQueriesStorage = CoreDataSymbolsQueriesStorage(maxStorageLimit: 10)
    lazy var symbolsResponseCache: SymbolsResponseStorage = CoreDataSymbolsResponseStorage()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    func makeSearchSymbolsUseCase() -> SearchSymbolsUseCase {
        DefaultSearchSymbolsUseCase(
            symbolsRepository: makeSymbolsRepository(),
            symbolsQueriesRepository: makeSymbolsQueriesRepository()
        )
    }
    
    func makeFetchRecentSymbolQueriesUseCase(
        requestValue: FetchRecentSymbolQueriesUseCase.RequestValue,
        completion: @escaping (FetchRecentSymbolQueriesUseCase.ResultValue) -> Void
    ) -> UseCase {
        FetchRecentSymbolQueriesUseCase(
            requestValue: requestValue,
            completion: completion,
            symbolsQueriesRepository: makeSymbolsQueriesRepository()
        )
    }
    
    // MARK: - Repositories
    func makeSymbolsRepository() -> SymbolsRepository {
        DefaultSymbolsRepository(
            dataTransferService: dependencies.apiDataTransferService,
            cache: symbolsResponseCache
        )
    }
    func makeSymbolsQueriesRepository() -> SymbolsQueriesRepository {
        DefaultSymbolsQueriesRepository(
            dataTransferService: dependencies.apiDataTransferService,
            symbolsQueriesPersistentStorage: symbolsQueriesStorage
        )
    }
    
    // MARK: - Symbols List
    func makeSymbolsListViewController(actions: SymbolsListViewModelActions) -> SymbolsListViewController {
        SymbolsListViewController.create(
            with: makeSymbolsListViewModel(actions: actions)
        )
    }
    
    func makeSymbolsListViewModel(actions: SymbolsListViewModelActions) -> SymbolsListViewModel {
        DefaultSymbolsListViewModel(
            searchSymbolsUseCase: makeSearchSymbolsUseCase(),
            actions: actions
        )
    }
    
    // MARK: - Symbol Details
    func makeSymbolsDetailsViewController(symbol: Symbol, withEntrypoint entryPoint: String?) -> UIViewController {
        SymbolDetailsViewController.create(
            with: makeSymbolsDetailsViewModel(symbol: symbol),
            withEntrypoint: entryPoint
        )
    }
    
    func makeSymbolsDetailsViewModel(symbol: Symbol) -> SymbolDetailsViewModel {
        DefaultSymbolDetailsViewModel(
            symbol: symbol
        )
    }
    
    // MARK: - Symbols Queries Suggestions List
    func makeSymbolsQueriesSuggestionsListViewController(didSelect: @escaping SymbolsQueryListViewModelDidSelectAction) -> UIViewController {
        return SymbolsQueriesTableViewController.create(
            with: makeSymbolsQueryListViewModel(didSelect: didSelect)
        )
    }
    
    func makeSymbolsQueryListViewModel(didSelect: @escaping SymbolsQueryListViewModelDidSelectAction) -> SymbolsQueryListViewModel {
        DefaultSymbolsQueryListViewModel(
            numberOfQueriesToShow: 10,
            fetchRecentSymbolQueriesUseCaseFactory: makeFetchRecentSymbolQueriesUseCase,
            didSelect: didSelect
        )
    }

    // MARK: - Flow Coordinators
    func makeSymbolsSearchFlowCoordinator(navigationController: UINavigationController) -> SymbolsSearchFlowCoordinator {
        SymbolsSearchFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
