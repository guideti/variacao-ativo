//
//  StrokeAnimation.swift
//  variacao-ativa
//
//  Created by Raul Rodrigo on 12/03/23.
//

import Foundation
import UIKit

class StrokeAnimation: CABasicAnimation {
    
    enum StrokeType {
        case start
        case end
    }
    
    override init() {
        super.init()
    }
    
    init(type: StrokeType, beginTime: Double = 0.0, fromValue: CGFloat, toValue: CGFloat, duration: Double) {
        
        super.init()
        
        self.keyPath = type == .start ? "strokeStart" : "strokeEnd"
        
        self.beginTime = beginTime
        self.fromValue = fromValue
        self.toValue = toValue
        self.duration = duration
        self.timingFunction = .init(name: .easeInEaseOut)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
