//
//  ViewController.swift
//  stockpricechange
//
//  Created by Lucas Monteiro on 06/02/23.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        // Make a button to call the showFlutter function when pressed.
//        let button = UIButton(type:UIButton.ButtonType.custom)
//        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
//        button.setTitle("Show Flutter!", for: UIControl.State.normal)
//        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
//        button.backgroundColor = UIColor.blue
//        self.view.addSubview(button)
    }

    @IBAction func showFlutter(_ sender: UIButton) {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        present(flutterViewController, animated: true, completion: nil)
    }
}

