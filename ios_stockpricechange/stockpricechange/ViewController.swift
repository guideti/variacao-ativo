//
//  ViewController.swift
//  stockpricechange
//
//  Created by Lucas Monteiro on 06/02/23.
//

import UIKit
import Flutter

class ViewController: UIViewController, SPHostNavigationApi {
    private var api: SPFlutterStockApi!
    private var flutterViewController: FlutterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        api = SPFlutterStockApi.init(binaryMessenger: appDelegate.flutterEngine.binaryMessenger)
        SPHostNavigationApiSetup(appDelegate.flutterEngine.binaryMessenger, self)
    }

    @IBAction func showTable(_ sender: Any) {
        showFlutter(visualisationType: SPVisualisationType.table)
    }
    
    @IBAction func showChart(_ sender: Any) {
        showFlutter(visualisationType: SPVisualisationType.chart)
    }
    
    func showFlutter(visualisationType: SPVisualisationType) {
        api.chooseVisualisationTypeVisualisation(SPVisualisation.make(with: visualisationType)) { (error) in
            if let error = error {
                print(error)
            }
        }
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        flutterViewController.modalPresentationStyle = .overCurrentContext
        flutterViewController.isViewOpaque = true
        present(flutterViewController, animated: true, completion: nil)
    }
    
    func goBackWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        flutterViewController.dismiss(animated: true)
    }
}

