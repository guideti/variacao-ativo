//
//  ViewController.swift
//  stockpricechange
//
//  Created by Lucas Monteiro on 06/02/23.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    private var api: FlutterStockApi!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        api = FlutterStockApi.init(binaryMessenger: appDelegate.flutterEngine.binaryMessenger)
    }

    @IBAction func showTable(_ sender: Any) {
        showFlutter(visualisationType: VisualisationType.table)
    }
    
    @IBAction func showChart(_ sender: Any) {
        showFlutter(visualisationType: VisualisationType.chart)
    }
    
    func showFlutter(visualisationType: VisualisationType) {
        api.displayStockDataVisualisation(Visualisation.make(with: visualisationType)) { (error) in
            if let error = error {
                print(error)
            }
        }
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        present(flutterViewController, animated: true, completion: nil)
    }
}

