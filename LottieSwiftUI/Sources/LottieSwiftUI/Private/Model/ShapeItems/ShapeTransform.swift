//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

class ShapeTransform: ShapeItem {
    /// Anchor Point
    let anchor: KeyframeGroup<Vector3D>
    
    /// Position
    let position: KeyframeGroup<Vector3D>
    
    /// Scale
    let scale: KeyframeGroup<Vector3D>
    
    /// Rotation
    let rotation: KeyframeGroup<Vector1D>
    
    /// opacity
    let opacity: KeyframeGroup<Vector1D>
    
    /// Skew
    let skew: KeyframeGroup<Vector1D>
    
    /// Skew Axis
    let skewAxis: KeyframeGroup<Vector1D>
    
    private enum CodingKeys : String, CodingKey {
        case anchor = "a"
        case position = "p"
        case scale = "s"
        case rotation = "r"
        case opacity = "o"
        case skew = "sk"
        case skewAxis = "sa"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ShapeTransform.CodingKeys.self)
        self.anchor = try container.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .anchor) ?? KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
        self.position = try container.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .position) ?? KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
        self.scale = try container.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .scale) ?? KeyframeGroup(Vector3D(x: Double(100), y: 100, z: 100))
        self.rotation = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .rotation) ?? KeyframeGroup(Vector1D(0))
        self.opacity = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .opacity) ?? KeyframeGroup(Vector1D(100))
        self.skew = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .skew) ?? KeyframeGroup(Vector1D(0))
        self.skewAxis =  try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .skewAxis) ?? KeyframeGroup(Vector1D(0))
        try super.init(from: decoder)
    }
}
