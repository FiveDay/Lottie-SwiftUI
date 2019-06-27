//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation
import QuartzCore
/**
 The base animation container.
 
 This layer holds a single composition container and allows for animation of
 the currentFrame property.
 */

class AnimationContainer: CALayer {
    
    /// The animatable Current Frame Property
//    var currentFrame: CGFloat
    
    var animationLayers: [CompositionLayer]
    
    init(animation: Animation) {
        
        self.animationLayers = []
        super.init()

        bounds = animation.bounds
        
        let layers = animation.layers.initializeCompositionLayers()
        
        for layer in layers {
            layer.bounds = bounds
            animationLayers.append(layer)
            addSublayer(layer)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
