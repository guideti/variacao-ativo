//
//  LoadingView.swift
//  app-ios
//
//  Created by Lucas Mendonca de Albuquerque on 21/03/23.
//

import UIKit

class LoadingView {
    internal static var spinner: UIActivityIndicatorView?

    static func show() {
        DispatchQueue.main.async {
            NotificationCenter.default.addObserver(self, selector: #selector(update), name: UIDevice.orientationDidChangeNotification, object: nil)
            if spinner == nil, let window = UIApplication.shared.keyWindow {
                let frame = UIScreen.main.bounds
                let spinner = UIActivityIndicatorView(frame: frame)
                spinner.backgroundColor = UIColor.black.withAlphaComponent(0.2)
                spinner.style = .whiteLarge
                window.addSubview(spinner)

                spinner.startAnimating()
                self.spinner = spinner
            }
        }
    }

    static func hide() {
        DispatchQueue.main.async {
            guard let spinner = spinner else { return }
            spinner.stopAnimating()
            spinner.removeFromSuperview()
            self.spinner = nil
        }
    }

    @objc static func update() {
        DispatchQueue.main.async {
            if spinner != nil {
                hide()
                show()
            }
        }
    }
}

