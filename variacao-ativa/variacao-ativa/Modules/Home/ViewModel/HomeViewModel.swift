//
//  HomeViewModel.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import Foundation

protocol HomeViewToHomeViewModelProtocol {
    func requestActives()
}

protocol HomeViewModelToHomeViewProtocol: AnyObject {
    func onGetActiveSuccess(actives: [ActiveModel])
    func onGetActiveError()
}

class HomeViewModel {
    var homeRequest: HomeRequestProtocol?
    
    var selectedActive: String?
    
    weak var delegate: HomeViewModelToHomeViewProtocol?
    
    init() {
        homeRequest = HomeRequest()
    }
}

extension HomeViewModel: HomeViewToHomeViewModelProtocol {
    func requestActives() {
        homeRequest?.getActives(sucessCallback: { active in
            self.delegate?.onGetActiveSuccess(actives: active)
        }, failureCallback: { error in
            self.delegate?.onGetActiveError()
        })
    }
}
