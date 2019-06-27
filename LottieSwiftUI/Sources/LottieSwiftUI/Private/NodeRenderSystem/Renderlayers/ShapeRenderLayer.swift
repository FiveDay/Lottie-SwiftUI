//
//  ShapeRenderLayer.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation
import QuartzCore

class ShapeRenderLayer: ShapeContainerLayer {
    
    fileprivate(set) var renderer: Renderable & NodeOutput

    let shapeLayer = CAShapeLayer()
    
    init(renderer: Renderable & NodeOutput) {
        
        self.renderer = renderer
        super.init()

        self.actions = [
            "position" : NSNull(),
            "bounds" : NSNull(),
            "anchorPoint" : NSNull(),
            "path" : NSNull(),
            "transform" : NSNull(),
            "opacity" : NSNull()
        ]
        shapeLayer.actions = [
            "position" : NSNull(),
            "bounds" : NSNull(),
            "anchorPoint" : NSNull(),
            "path" : NSNull(),
            "fillColor" : NSNull(),
            "strokeColor" : NSNull(),
            "lineWidth" : NSNull(),
            "miterLimit" : NSNull(),
            "lineDashPhase" : NSNull(),
        ]

        addSublayer(shapeLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
