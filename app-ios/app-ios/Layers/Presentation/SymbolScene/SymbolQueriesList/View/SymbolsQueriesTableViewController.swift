//
//  SymbolsQueriesItemCell.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import UIKit

final class SymbolsQueriesTableViewController: UITableViewController, StoryboardInstantiable {
    
    private var viewModel: SymbolsQueryListViewModel!

    // MARK: - Lifecycle

    static func create(with viewModel: SymbolsQueryListViewModel) -> SymbolsQueriesTableViewController {
        let view = SymbolsQueriesTableViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }
    
    private func bind(to viewModel: SymbolsQueryListViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.tableView.reloadData() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.viewWillAppear()
    }

    // MARK: - Private

    private func setupViews() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = SymbolsQueriesItemCell.height
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SymbolsQueriesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SymbolsQueriesItemCell.reuseIdentifier, for: indexPath) as? SymbolsQueriesItemCell else {
            assertionFailure("Cannot dequeue reusable cell \(SymbolsQueriesItemCell.self) with reuseIdentifier: \(SymbolsQueriesItemCell.reuseIdentifier)")
            return UITableViewCell()
        }
        cell.fill(with: viewModel.items.value[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.didSelect(item: viewModel.items.value[indexPath.row])
    }
}
