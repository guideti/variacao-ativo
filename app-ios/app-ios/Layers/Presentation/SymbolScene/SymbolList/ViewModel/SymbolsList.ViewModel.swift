//
//  SymbolsList.ViewModel.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

struct SymbolsListViewModelActions {
    /// Note: if you would need to edit symbol inside Details screen and update this Symbols List screen with updated symbol then you would need this closure:
    /// showSymbolDetails: (Symbol, @escaping (_ updated: Symbol) -> Void) -> Void
    let showSymbolDetails: (Symbol, String?) -> Void
    let showSymbolQueriesSuggestions: (@escaping (_ didSelect: SymbolQuery) -> Void) -> Void
    let closeSymbolQueriesSuggestions: () -> Void
}

enum SymbolsListViewModelLoading {
    case fullScreen
    case nextPage
}

protocol SymbolsListViewModelInput {
    func viewDidLoad()
    func didLoadNextPage()
    func didSearch(query: String)
    func didCancelSearch()
    func showQueriesSuggestions()
    func closeQueriesSuggestions()
    func didSelectItem(at index: Int)
}

protocol SymbolsListViewModelOutput {
    var items: Observable<[SymbolsListItemViewModel]> { get }
    var loading: Observable<SymbolsListViewModelLoading?> { get }
    var query: Observable<String> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var screenTitle: String { get }
    var emptyDataTitle: String { get }
    var errorTitle: String { get }
    var searchBarPlaceholder: String { get }
}

typealias SymbolsListViewModel = SymbolsListViewModelInput & SymbolsListViewModelOutput

final class DefaultSymbolsListViewModel: SymbolsListViewModel {

    private let searchSymbolsUseCase: SearchSymbolsUseCase
    private let actions: SymbolsListViewModelActions?
    
    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var hasMorePages: Bool { currentPage < totalPageCount }
    var nextPage: Int { hasMorePages ? currentPage + 1 : currentPage }

    private var pages: [SymbolsPage] = []
    private var symbolsLoadTask: Cancellable? { willSet { symbolsLoadTask?.cancel() } }
    private let onMainThreadExecutor: OnMainThreadExecutor = DefaultOnMainThreadExecutor()

    // MARK: - OUTPUT

    let items: Observable<[SymbolsListItemViewModel]> = Observable([])
    let loading: Observable<SymbolsListViewModelLoading?> = Observable(.none)
    let query: Observable<String> = Observable("")
    let error: Observable<String> = Observable("")
    var isEmpty: Bool { return items.value.isEmpty }
    let screenTitle = NSLocalizedString("Yahoo Símbolos", comment: "")
    let emptyDataTitle = NSLocalizedString("Procurar Resultados", comment: "")
    let errorTitle = NSLocalizedString("Erro", comment: "")
    let searchBarPlaceholder = NSLocalizedString("Pesquisar Símbolos do Yahoo", comment: "")

    // MARK: - Init
    
    init(
        searchSymbolsUseCase: SearchSymbolsUseCase,
        actions: SymbolsListViewModelActions? = nil
    ) {
        self.searchSymbolsUseCase = searchSymbolsUseCase
        self.actions = actions
    }

    // MARK: - Private

    private func appendPage(_ symbolsPage: SymbolsPage) {
        pages = pages
            .filter { $0.quotes != symbolsPage.quotes }
            + [symbolsPage]
        items.value = pages.symbols.map(SymbolsListItemViewModel.init)
    }

    private func resetPages() {
        currentPage = 0
        totalPageCount = 1
        pages.removeAll()
        items.value.removeAll()
    }

    private func load(symbolQuery: SymbolQuery, loading: SymbolsListViewModelLoading) {
        self.loading.value = loading
        query.value = symbolQuery.query

        symbolsLoadTask = searchSymbolsUseCase.execute(
            requestValue: .init(query: symbolQuery),
            cached: { [weak self] page in
                self?.onMainThreadExecutor.execute {
                    self?.appendPage(page)
                }
            },
            completion: { [weak self] result in
                self?.onMainThreadExecutor.execute {
                    switch result {
                    case .success(let page):
                        self?.appendPage(page)
                    case .failure(let error):
                        self?.handle(error: error)
                    }
                    self?.loading.value = .none
                }
        })
    }

    private func handle(error: Error) {
        self.error.value = error.isInternetConnectionError ?
            NSLocalizedString("Sem conexão com a internet", comment: "") :
            NSLocalizedString("Falha ao carregar símbolos", comment: "")
    }

    private func update(symbolQuery: SymbolQuery) {
        resetPages()
        load(symbolQuery: symbolQuery, loading: .fullScreen)
    }
}

// MARK: - INPUT. View event methods

extension DefaultSymbolsListViewModel {

    func viewDidLoad() { }

    func didLoadNextPage() {
        load(symbolQuery: .init(query: query.value),
             loading: .nextPage)
    }

    func didSearch(query: String) {
        guard !query.isEmpty else { return }
        update(symbolQuery: SymbolQuery(query: query))
    }

    func didCancelSearch() {
        symbolsLoadTask?.cancel()
    }

    func showQueriesSuggestions() {
        actions?.showSymbolQueriesSuggestions(update(symbolQuery:))
    }

    func closeQueriesSuggestions() {
        actions?.closeSymbolQueriesSuggestions()
    }

    func didSelectItem(at index: Int) {
        actions?.showSymbolDetails(pages.symbols[index], nil)
    }
}

// MARK: - Private

private extension Array where Element == SymbolsPage {
    var symbols: [Symbol] { flatMap { $0.quotes } }
}

