//
//  HomeView.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import UIKit
import iOSDropDown

protocol HomeViewDelegate {
    func setActiveList(activeList: [String])
    func setButtonState(buttonState: Bool)
    func errorMessageState(hideMessage: Bool)
}

class HomeView: UIView {
    
    var viewController: HomeViewToHomeViewControllerProtocol?
    
    let dropDown: DropDown = {
        let dropdown = DropDown()
        dropdown.translatesAutoresizingMaskIntoConstraints = false
        dropdown.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dropdown.backgroundColor = .black.withAlphaComponent(0.3)
        dropdown.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dropdown.checkMarkEnabled = true
        dropdown.arrowSize = 15
        dropdown.selectedRowColor = .blue
        return dropdown
    }()
    
    var activeList: [String]? {
        didSet {
            dropDown.optionArray = activeList ?? ["Escolha um valor"]
        }
    }
    
    var isDropDownHidden: Bool = false {
        didSet {
            dropDown.isHidden = isDropDownHidden
        }
    }
    
    let errorMessage: UILabel = {
       let label = UILabel()
        label.text = "Algo deu errado!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    var isErrorMessageHide: Bool = true {
        didSet {
            errorMessage.isHidden = self.isErrorMessageHide
        }
    }
    
    let showActiveVariationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.3)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
     }()
    
    @objc func pressButton() {
        viewController?.onPressedButton()
    }
    
    var buttonTitle: String = "Alo" {
        didSet {
            showActiveVariationButton.setTitle(buttonTitle, for: .normal)
        }
    }
    
    var isButtonEnabled: Bool = false {
        didSet {
            showActiveVariationButton.isEnabled = isButtonEnabled
            showActiveVariationButton.backgroundColor = isButtonEnabled ? .blue : .blue.withAlphaComponent(0.3)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        dropDown.didSelect { selectedText, index, id in
            self.viewController?.getDropDownInfo(selectedText: selectedText)
        }
        showActiveVariationButton.addTarget(self, action: #selector(pressButton), for: .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            dropDown.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dropDown.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            errorMessage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorMessage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            showActiveVariationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            showActiveVariationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            showActiveVariationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
    }
    
    func configureView() {
        self.backgroundColor = .white
        addSubview(dropDown)
        addSubview(showActiveVariationButton)
        addSubview(errorMessage)
        constraints()
    }
}

extension HomeView: HomeViewDelegate {
    func errorMessageState(hideMessage: Bool) {
        isErrorMessageHide = hideMessage
        buttonTitle = hideMessage ? "Verificar ativos" : "Tentar novamente"
        isDropDownHidden = !hideMessage
    }
    
    func setActiveList(activeList: [String]) {
        self.activeList = activeList
    }
    
    func setButtonState(buttonState: Bool) {
        isButtonEnabled = buttonState
    }
}
