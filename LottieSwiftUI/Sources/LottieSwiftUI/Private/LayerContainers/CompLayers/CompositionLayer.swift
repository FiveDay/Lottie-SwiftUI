//
//  CompositionLayer.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation
import QuartzCore

/**
 The base class for a child layer of CompositionContainer
 */
class CompositionLayer: CALayer {
    
    let contentsLayer = CALayer()
    
    init(layer: LayerModel, size: CGSize) {

        super.init()
        
        anchorPoint = .zero
        actions = [
            "opacity" : NSNull(),
            "transform" : NSNull(),
            "bounds" : NSNull(),
            "anchorPoint" : NSNull(),
            "sublayerTransform" : NSNull()
        ]
        contentsLayer.anchorPoint = .zero
        contentsLayer.bounds = CGRect(origin: .zero, size: size)
        contentsLayer.actions = [
            "opacity" : NSNull(),
            "transform" : NSNull(),
            "bounds" : NSNull(),
            "anchorPoint" : NSNull(),
            "sublayerTransform" : NSNull(),
            "hidden" : NSNull()
        ]
        
        addSublayer(contentsLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
