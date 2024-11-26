//
//  SymbolsListItem.ViewModel.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

// **Note**: This item view model is to display data and does not contain any domain model to prevent views accessing it

import Foundation

struct SymbolsListItemViewModel: Equatable {
    let title: String
    let code: String
}

extension SymbolsListItemViewModel {
    init(symbol: Symbol) {
        self.title = symbol.longname ?? ""
        self.code = symbol.symbol ?? ""
    }
}
