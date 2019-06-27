//
//  ShapeContainerLayer.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation
import QuartzCore

/**
 The base layer that holds Shapes and Shape Renderers
 */
class ShapeContainerLayer: CALayer {
        
    override init() {
        super.init()
        
        self.actions = [
            "position" : NSNull(),
            "bounds" : NSNull(),
            "anchorPoint" : NSNull(),
            "transform" : NSNull(),
            "opacity" : NSNull()
        ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
