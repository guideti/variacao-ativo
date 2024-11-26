//
//  SymbolsQueryList.ViewModel.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

typealias SymbolsQueryListViewModelDidSelectAction = (SymbolQuery) -> Void

protocol SymbolsQueryListViewModelInput {
    func viewWillAppear()
    func didSelect(item: SymbolsQueryListItemViewModel)
}

protocol SymbolsQueryListViewModelOutput {
    var items: Observable<[SymbolsQueryListItemViewModel]> { get }
}

protocol SymbolsQueryListViewModel: SymbolsQueryListViewModelInput, SymbolsQueryListViewModelOutput { }

typealias FetchRecentSymbolQueriesUseCaseFactory = (
    FetchRecentSymbolQueriesUseCase.RequestValue,
    @escaping (FetchRecentSymbolQueriesUseCase.ResultValue) -> Void
) -> UseCase

final class DefaultSymbolsQueryListViewModel: SymbolsQueryListViewModel {
    private let numberOfQueriesToShow: Int
    private let fetchRecentSymbolQueriesUseCaseFactory: FetchRecentSymbolQueriesUseCaseFactory
    private let didSelect: SymbolsQueryListViewModelDidSelectAction?
    private let onMainThreadExecutor: OnMainThreadExecutor = DefaultOnMainThreadExecutor()
    
    // MARK: - OUTPUT
    let items: Observable<[SymbolsQueryListItemViewModel]> = Observable([])
    
    init(
        numberOfQueriesToShow: Int,
        fetchRecentSymbolQueriesUseCaseFactory: @escaping FetchRecentSymbolQueriesUseCaseFactory,
        didSelect: SymbolsQueryListViewModelDidSelectAction? = nil
    ) {
        self.numberOfQueriesToShow = numberOfQueriesToShow
        self.fetchRecentSymbolQueriesUseCaseFactory = fetchRecentSymbolQueriesUseCaseFactory
        self.didSelect = didSelect
    }
    
    private func updateSymbolsQueries() {
        let request = FetchRecentSymbolQueriesUseCase.RequestValue(maxCount: numberOfQueriesToShow)
        let completion: (FetchRecentSymbolQueriesUseCase.ResultValue) -> Void = { [weak self] result in
            self?.onMainThreadExecutor.execute {
                switch result {
                case .success(let items):
                    self?.items.value = items.map { $0.query }.map(SymbolsQueryListItemViewModel.init)
                case .failure: break
                }
            }
        }
        let useCase = fetchRecentSymbolQueriesUseCaseFactory(request, completion)
        useCase.start()
    }
}

// MARK: - INPUT. View event methods
extension DefaultSymbolsQueryListViewModel {
        
    func viewWillAppear() {
        updateSymbolsQueries()
    }
    
    func didSelect(item: SymbolsQueryListItemViewModel) {
        didSelect?(SymbolQuery(query: item.query))
    }
}
