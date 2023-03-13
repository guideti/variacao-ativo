//
//  HomeViewController.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import UIKit
import Flutter

protocol HomeViewToHomeViewControllerProtocol {
    func getDropDownInfo(selectedText: String)
    func onPressedButton()
}

class HomeViewController: UIViewController, ViewInterface {
    
    let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
    
    var flutterViewController: CustomFlutterViewController?
    
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
    func openFlutter() {
        present(flutterViewController!, animated: true, completion: nil)
    }
    
    func setLoading(isLoading: Bool) {
        showLoading(showLoading: isLoading)
    }
    
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
    func onPressedButton() {
        viewModel?.onPressedButton()
    }
    
    func getDropDownInfo(selectedText: String) {
        viewModel?.selectedActive = selectedText
        initializeFlutterEngine(selectedText: selectedText)
        delegate?.setButtonState(buttonState: true)
    }
}

private extension HomeViewController {
    func initializeFlutterEngine(selectedText: String) {
        flutterEngine.run()
        
        flutterViewController = CustomFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController!.param = viewModel?.selectedActive ?? " "
        flutterViewController!.modalPresentationStyle = .fullScreen
    }
}
