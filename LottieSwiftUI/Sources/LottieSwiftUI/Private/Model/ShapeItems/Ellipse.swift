//
//  Ellipse.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

/// An item that define an ellipse shape
class Ellipse: ShapeItem {
    
    /// The direction of the ellipse.
    let direction: PathDirection
    
    /// The position of the ellipse
    let position: KeyframeGroup<Vector3D>
    
    /// The size of the ellipse
    let size: KeyframeGroup<Vector3D>
    
    private enum CodingKeys : String, CodingKey {
        case direction = "d"
        case position = "p"
        case size = "s"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.direction = try container.decodeIfPresent(PathDirection.self, forKey: .direction) ?? .clockwise
        self.position = try container.decode(KeyframeGroup<Vector3D>.self, forKey: .position)
        self.size = try container.decode(KeyframeGroup<Vector3D>.self, forKey: .size)
        try super.init(from: decoder)
    }
}
