//
//  SymbolDetails.ViewModel.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

protocol SymbolDetailsViewModelOutput {
    var title: String { get }
    var code: String { get }
}

protocol SymbolDetailsViewModel: SymbolDetailsViewModelOutput { }

final class DefaultSymbolDetailsViewModel: SymbolDetailsViewModel {
    private let onMainThreadExecutor: OnMainThreadExecutor = DefaultOnMainThreadExecutor()

    // MARK: - OUTPUT
    let title: String
    let code: String
    
    init(symbol: Symbol) {
        self.title = symbol.longname ?? ""
        self.code = symbol.symbol ?? ""
    }
}
