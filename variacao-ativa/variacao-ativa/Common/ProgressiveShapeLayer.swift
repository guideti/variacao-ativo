//
//  ProgressiveShapeLayer.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import UIKit

class ProgressiveShapeLayer: CAShapeLayer {
    public init(strokeColor: UIColor, lineWidth: CGFloat) {
        super.init()
        
        self.strokeColor = strokeColor.cgColor
        self.lineWidth = lineWidth
        self.fillColor = UIColor.clear.cgColor
        self.lineCap = .round
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
