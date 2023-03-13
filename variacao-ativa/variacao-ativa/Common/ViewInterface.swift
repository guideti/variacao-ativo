//
//  ViewInterface.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import UIKit
protocol ViewInterface: AnyObject {
    func showLoading(showLoading: Bool)
}

extension ViewInterface where Self: UIViewController {
    
    func showLoading(showLoading: Bool) {
        
        let tag = 99
        if showLoading {
            let view = UIView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
            view.backgroundColor = UIColor.white
            view.tag = tag
            
            let loadingIndicator: ProgressiveView = {
                let progress = ProgressiveView(colors: [.blue,.darkGray], lineWidth: 7)
                progress.translatesAutoresizingMaskIntoConstraints = false
                return progress
            }()
            view.addSubview(loadingIndicator)
            
            loadingIndicator.animateStroke()
                        
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            loadingIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
            loadingIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            self.view.addSubview(view)
            
        } else {
            for views in self.view.subviews where views.tag == tag {
                for activity in views.subviews where activity is ProgressiveView {
                    views.removeFromSuperview()
                }
            }
        }
    }
}
