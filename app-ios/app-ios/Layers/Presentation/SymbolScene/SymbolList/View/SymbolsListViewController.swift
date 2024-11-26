//
//  SymbolsListViewController.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import UIKit

final class SymbolsListViewController: UIViewController, StoryboardInstantiable, Alertable {
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var symbolsListContainer: UIView!
    @IBOutlet private(set) var suggestionsListContainer: UIView!
    @IBOutlet private var searchBarContainer: UIView!
    @IBOutlet private var emptyDataLabel: UILabel!
    
    private var viewModel: SymbolsListViewModel!

    private var symbolsTableViewController: SymbolsListTableViewController?
    private var searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle

    static func create(
        with viewModel: SymbolsListViewModel
    ) -> SymbolsListViewController {
        let view = SymbolsListViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBehaviours()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    private func bind(to viewModel: SymbolsListViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        viewModel.query.observe(on: self) { [weak self] in self?.updateSearchQuery($0) }
        viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.isActive = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: SymbolsListTableViewController.self),
            let destinationVC = segue.destination as? SymbolsListTableViewController {
            symbolsTableViewController = destinationVC
            symbolsTableViewController?.viewModel = viewModel
        }
    }

    // MARK: - Private

    private func setupViews() {
        title = viewModel.screenTitle
        emptyDataLabel.text = viewModel.emptyDataTitle
        setupSearchController()
    }

    private func setupBehaviours() {
        addBehaviors([BackButtonEmptyTitleNavigationBarBehavior(), BlackStyleNavigationBarBehavior()])
    }

    private func updateItems() {
        symbolsTableViewController?.reload()
    }

    private func updateLoading(_ loading: SymbolsListViewModelLoading?) {
        emptyDataLabel.isHidden = true
        symbolsListContainer.isHidden = true
        suggestionsListContainer.isHidden = true
        LoadingView.hide()

        switch loading {
            case .fullScreen: LoadingView.show()
            case .nextPage: symbolsListContainer.isHidden = false
            case .none:
                symbolsListContainer.isHidden = viewModel.isEmpty
                emptyDataLabel.isHidden = !viewModel.isEmpty
        }

        symbolsTableViewController?.updateLoading(loading)
        updateQueriesSuggestions()
    }

    private func updateQueriesSuggestions() {
        guard searchController.searchBar.isFirstResponder else {
            viewModel.closeQueriesSuggestions()
            return
        }
        viewModel.showQueriesSuggestions()
    }

    private func updateSearchQuery(_ query: String) {
        searchController.isActive = false
        searchController.searchBar.text = query
    }

    private func showError(_ error: String) {
        guard !error.isEmpty else { return }
        showAlert(title: viewModel.errorTitle, message: error)
    }
}

// MARK: - Search Controller

extension SymbolsListViewController {
    private func setupSearchController() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = viewModel.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = true
        // searchController.searchBar.barStyle = .black
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.frame = searchBarContainer.bounds
        searchController.searchBar.autoresizingMask = [.flexibleWidth]
        searchBarContainer.addSubview(searchController.searchBar)
        definesPresentationContext = true
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.accessibilityIdentifier = AccessibilityIdentifier.searchField
        }
    }
}

extension SymbolsListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchController.isActive = false
        viewModel.didSearch(query: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.didCancelSearch()
    }
}

extension SymbolsListViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        updateQueriesSuggestions()
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        updateQueriesSuggestions()
    }

    func didDismissSearchController(_ searchController: UISearchController) {
        updateQueriesSuggestions()
    }
}

