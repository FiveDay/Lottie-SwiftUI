//
//  NullCompositionLayer.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

class NullCompostionLayer: CompositionLayer {
    init(layer: LayerModel) {
        super.init(layer: layer, size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
