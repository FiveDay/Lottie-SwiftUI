//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

class Repeater: ShapeItem {
    
    /// The number of copies to repeat
    let copies: KeyframeGroup<Vector1D>
    
    /// The offset of each copy
    let offset: KeyframeGroup<Vector1D>
    
    /// Start Opacity
    let startOpacity: KeyframeGroup<Vector1D>
    
    /// End opacity
    let endOpacity: KeyframeGroup<Vector1D>
    
    /// The rotation
    let rotation: KeyframeGroup<Vector1D>
    
    /// Anchor Point
    let anchorPoint: KeyframeGroup<Vector3D>
    
    /// Position
    let position: KeyframeGroup<Vector3D>
    
    /// Scale
    let scale: KeyframeGroup<Vector3D>
    
    private enum CodingKeys : String, CodingKey {
        case copies = "c"
        case offset = "o"
        case transform = "tr"
    }
    
    private enum TransformKeys : String, CodingKey {
        case rotation = "r"
        case startOpacity = "so"
        case endOpacity = "eo"
        case anchorPoint = "a"
        case position = "p"
        case scale = "s"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Repeater.CodingKeys.self)
        self.copies = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .copies) ?? KeyframeGroup(Vector1D(0))
        self.offset = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .offset) ?? KeyframeGroup(Vector1D(0))
        let transformContainer = try container.nestedContainer(keyedBy: TransformKeys.self, forKey: .transform)
        self.startOpacity = try transformContainer.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .startOpacity) ?? KeyframeGroup(Vector1D(100))
        self.endOpacity = try transformContainer.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .endOpacity) ?? KeyframeGroup(Vector1D(100))
        self.rotation = try transformContainer.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .rotation) ?? KeyframeGroup(Vector1D(0))
        self.position = try transformContainer.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .position) ?? KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
        self.anchorPoint = try transformContainer.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .anchorPoint) ?? KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
        self.scale = try transformContainer.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .scale) ?? KeyframeGroup(Vector3D(x: Double(100), y: 100, z: 100))
        try super.init(from: decoder)
    }
}
