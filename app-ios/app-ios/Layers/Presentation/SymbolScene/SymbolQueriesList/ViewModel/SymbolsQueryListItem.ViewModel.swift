//
//  SymbolsQueryListItem.ViewModel.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import Foundation

class SymbolsQueryListItemViewModel {
    let query: String

    init(query: String) {
        self.query = query
    }
}

extension SymbolsQueryListItemViewModel: Equatable {
    static func == (lhs: SymbolsQueryListItemViewModel, rhs: SymbolsQueryListItemViewModel) -> Bool {
        return lhs.query == rhs.query
    }
}
