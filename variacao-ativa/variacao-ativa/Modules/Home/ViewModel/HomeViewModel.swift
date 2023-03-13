//
//  HomeViewModel.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import Foundation
import Flutter
import UIKit

protocol HomeViewToHomeViewModelProtocol {
    func requestActives()
    func onPressedButton()
}

protocol HomeViewModelToHomeViewProtocol: AnyObject {
    func onGetActiveSuccess(actives: [ActiveModel])
    func onGetActiveError()
    func setLoading(isLoading: Bool)
    func openFlutter()
}

class HomeViewModel {
    var homeRequest: HomeRequestProtocol?
    
    var selectedActive: String?
    
    var isError: Bool = false
    
    weak var delegate: HomeViewModelToHomeViewProtocol?
    
    init() {
        homeRequest = HomeRequest()
    }
}

extension HomeViewModel: HomeViewToHomeViewModelProtocol {
    func onPressedButton() {
        if(isError) {
            delegate?.setLoading(isLoading: true)
            requestActives()
            return
        }
        delegate?.openFlutter()
    }
    
    func requestActives() {
        homeRequest?.getActives(sucessCallback: { active in
            self.delegate?.onGetActiveSuccess(actives: active)
            self.isError = false
        }, failureCallback: { error in
            self.delegate?.onGetActiveError()
            self.isError = true
        })
    }
}
