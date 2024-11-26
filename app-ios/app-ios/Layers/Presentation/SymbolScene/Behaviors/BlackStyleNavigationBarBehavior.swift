//
//  BlackStyleNavigationBarBehavior.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import UIKit

struct BlackStyleNavigationBarBehavior: ViewControllerLifecycleBehavior {
    func viewDidLoad(viewController: UIViewController) {
        viewController.navigationController?.navigationBar.barStyle = .black
    }
}

