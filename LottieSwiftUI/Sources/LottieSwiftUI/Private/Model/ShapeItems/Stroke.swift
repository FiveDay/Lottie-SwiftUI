//
//  Stroke.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

/// An item that define an line shape
class Stroke: ShapeItem {
    
    /// The opacity of the stroke
    let opacity: KeyframeGroup<Vector1D>
    
    /// The Color of the stroke
    let color: KeyframeGroup<Color>
    
    /// The width of the stroke
    let width: KeyframeGroup<Vector1D>
    
    /// Line Cap
    let lineCap: LineCap
    
    /// Line Join
    let lineJoin: LineJoin
    
    /// Miter Limit
    let miterLimit: Double
    
    /// The dash pattern of the stroke
    let dashPattern: [DashElement]?
    
    private enum CodingKeys : String, CodingKey {
        case opacity = "o"
        case color = "c"
        case width = "w"
        case lineCap = "lc"
        case lineJoin = "lj"
        case miterLimit = "ml"
        case dashPattern = "d"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Stroke.CodingKeys.self)
        self.opacity = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .opacity)
        self.color = try container.decode(KeyframeGroup<Color>.self, forKey: .color)
        self.width = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .width)
        self.lineCap = try container.decodeIfPresent(LineCap.self, forKey: .lineCap) ?? .round
        self.lineJoin = try container.decodeIfPresent(LineJoin.self, forKey: .lineJoin) ?? .round
        self.miterLimit = try container.decodeIfPresent(Double.self, forKey: .miterLimit) ?? 4
        self.dashPattern = try container.decodeIfPresent([DashElement].self, forKey: .dashPattern)
        try super.init(from: decoder)
    }
}
