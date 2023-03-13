//
//  HomeViewController.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import UIKit

protocol HomeViewToHomeViewControllerProtocol {
    func getDropDownInfo(selectedText: String)
}

class HomeViewController: UIViewController, ViewInterface {
    
    var delegate: HomeViewDelegate?
    
    var viewInstace: HomeView?
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewInstace = HomeView()
        viewInstace?.viewController = self
        viewModel = HomeViewModel()
        viewInstace?.configureView()
        delegate = viewInstace
        view = viewInstace
        viewModel?.delegate = self
        showLoading(showLoading: true)
        viewModel?.requestActives()
    }
}

extension HomeViewController: HomeViewModelToHomeViewProtocol {
    func onGetActiveSuccess(actives: [ActiveModel]) {
        let listString = actives.map {$0.name}
        delegate?.setActiveList(activeList: listString)
        delegate?.errorMessageState(hideMessage: true)
        showLoading(showLoading: false)
    }
    
    func onGetActiveError() {
        delegate?.errorMessageState(hideMessage: false)
        delegate?.setButtonState(buttonState: true)
        showLoading(showLoading: false)
    }
}

extension HomeViewController: HomeViewToHomeViewControllerProtocol {
    func getDropDownInfo(selectedText: String) {
        viewModel?.selectedActive = selectedText
        delegate?.setButtonState(buttonState: true)
    }
}
