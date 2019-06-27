//
//  ShapeCompositonLayer.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

/**
 A CompositionLayer responsible for initializing and rendering shapes
 */

class ShpaeCompositionLayer: CompositionLayer {
    
    let renderContainer: ShapeContainerLayer?
    
    init(shapeLayer: ShapeLayerModel) {
        
        let renderContainer = ShapeContainerLayer()
        self.renderContainer = renderContainer
        super.init(layer: shapeLayer, size: .zero)
        
        contentsLayer.addSublayer(renderContainer)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
