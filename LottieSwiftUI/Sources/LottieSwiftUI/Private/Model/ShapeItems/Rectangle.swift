//
//  Rectangle.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

/// An item that define an ellipse shape
class Rectangle: ShapeItem {
    
    /// The direction of the rect.
    let direction: PathDirection
    
    /// The position
    let position: KeyframeGroup<Vector3D>
    
    /// The size
    let size: KeyframeGroup<Vector3D>
    
    /// The Corner radius of the rectangle
    let cornerRadius: KeyframeGroup<Vector1D>
    
    enum CodingKeys: String, CodingKey {
        case direction = "d"
        case position = "p"
        case size = "s"
        case cornerRadius = "r"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Rectangle.CodingKeys.self)
        self.direction = try container.decodeIfPresent(PathDirection.self, forKey: .direction) ?? .clockwise
        self.position = try container.decode(KeyframeGroup<Vector3D>.self, forKey: .position)
        self.size = try container.decode(KeyframeGroup<Vector3D>.self, forKey: .size)
        self.cornerRadius = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .cornerRadius)
        try super.init(from: decoder)
    }
    
}
