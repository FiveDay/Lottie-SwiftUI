//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

extension Array where Element == LayerModel {
    
    func initializeCompositionLayers() -> [CompositionLayer] {
        var compositionLayers = [CompositionLayer]()
        
        for layer in self {
            if layer.hidden == true {
                let genericLayer = NullCompostionLayer(layer: layer)
                compositionLayers.append(genericLayer)
            } else if let shapeLayer = layer as? ShapeLayerModel {
                let shapeContainer = ShpaeCompositionLayer(shapeLayer: shapeLayer)
                compositionLayers.append(shapeContainer)
            } else {
                let genericlayer = NullCompostionLayer(layer: layer)
                compositionLayers.append(genericlayer)
            }
        }
        
        return compositionLayers
    }
}
