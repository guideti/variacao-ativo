//
//  SymbolsSearchFlowCoordinator.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import UIKit

protocol SymbolsSearchFlowCoordinatorDependencies  {
    func makeSymbolsListViewController(
        actions: SymbolsListViewModelActions
    ) -> SymbolsListViewController
    func makeSymbolsDetailsViewController(symbol: Symbol, withEntrypoint entryPoint: String?) -> UIViewController
    func makeSymbolsQueriesSuggestionsListViewController(
        didSelect: @escaping SymbolsQueryListViewModelDidSelectAction
    ) -> UIViewController
}

final class SymbolsSearchFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: SymbolsSearchFlowCoordinatorDependencies

    private weak var symbolsListVC: SymbolsListViewController?
    private weak var symbolsQueriesSuggestionsVC: UIViewController?

    init(navigationController: UINavigationController,
         dependencies: SymbolsSearchFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow do not need to be strong referenced
        let actions = SymbolsListViewModelActions(showSymbolDetails: showSymbolDetails,
                                                 showSymbolQueriesSuggestions: showSymbolQueriesSuggestions,
                                                 closeSymbolQueriesSuggestions: closeSymbolQueriesSuggestions)
        let vc = dependencies.makeSymbolsListViewController(actions: actions)

        navigationController?.pushViewController(vc, animated: false)
        symbolsListVC = vc
    }

    private func showSymbolDetails(symbol: Symbol, withEntrypoint entryPoint: String?) {
        let vc = dependencies.makeSymbolsDetailsViewController(symbol: symbol, withEntrypoint: entryPoint)
        navigationController?.pushViewController(vc, animated: true)
    }

    private func showSymbolQueriesSuggestions(didSelect: @escaping (SymbolQuery) -> Void) {
        guard let symbolsListViewController = symbolsListVC, symbolsQueriesSuggestionsVC == nil,
            let container = symbolsListViewController.suggestionsListContainer else { return }

        let vc = dependencies.makeSymbolsQueriesSuggestionsListViewController(didSelect: didSelect)

        symbolsListViewController.add(child: vc, container: container)
        symbolsQueriesSuggestionsVC = vc
        container.isHidden = false
    }

    private func closeSymbolQueriesSuggestions() {
        symbolsQueriesSuggestionsVC?.remove()
        symbolsQueriesSuggestionsVC = nil
        symbolsListVC?.suggestionsListContainer.isHidden = true
    }
}

