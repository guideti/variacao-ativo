//
//  SymbolsListItem.Cell.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import UIKit

final class SymbolsListItemCell: UITableViewCell {
    static let reuseIdentifier = String(describing: SymbolsListItemCell.self)
    static let height = CGFloat(130)

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var codeLabel: UILabel!

    private var viewModel: SymbolsListItemViewModel!
    private let onMainThreadExecutor: OnMainThreadExecutor = DefaultOnMainThreadExecutor()

    func fill(
        with viewModel: SymbolsListItemViewModel
    ) {
        self.viewModel = viewModel

        titleLabel.text = viewModel.title
        codeLabel.text = viewModel.code
    }
}

