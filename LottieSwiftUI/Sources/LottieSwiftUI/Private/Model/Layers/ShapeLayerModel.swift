//
//  ShapeLayerModel.swift
//  Hupo
//
//  Created by zhangyu528 on 2019/6/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import Foundation

class ShapeLayerModel: LayerModel {
    
    /// A list of shape items.
    let items: [ShapeItem]
    
    enum CodingKeys: String, CodingKey {
        case items = "shapes"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([ShapeItem].self, ofFamily: ShapeType.self, forKey: .items);
        try super.init(from: decoder)
    }
}
