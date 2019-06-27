//
//  Shape.swift
//  Hupo
//
//  Created by zhangyu528 on 2019/6/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import Foundation


/// An item that define an ellipse shape
class Shape: ShapeItem {
    
    /// The Path
    let path: KeyframeGroup<BezierPath>
    
    let direction: PathDirection?
    
    private enum CodingKeys : String, CodingKey {
        case path = "ks"
        case direction = "d"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.path = try container.decode(KeyframeGroup<BezierPath>.self, forKey: .path)
        self.direction = try container.decodeIfPresent(PathDirection.self, forKey: .direction)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(path, forKey: .path)
        try container.encodeIfPresent(direction, forKey: .direction)
    }
    
}
