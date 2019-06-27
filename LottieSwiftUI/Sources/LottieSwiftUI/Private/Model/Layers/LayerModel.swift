//
//  LayerModel.swift
//  Hupo
//
//  Created by zhangyu528 on 2019/6/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import Foundation

enum LayerType: Int, Codable {
    case precomp
    case solid
    case image
    case null
    case shape
    case text
}

/// Used for mapping a heterogeneous list to classes for parsing.
extension LayerType: ClassFamily {
    static var discriminator: Discriminator = .type

    func getType() -> AnyObject.Type {
        switch self {
        case .precomp:
            return LayerModel.self
        case .solid:
            return LayerModel.self
        case .image:
            return LayerModel.self
        case .null:
            return LayerModel.self
        case .shape:
            return ShapeLayerModel.self
        case .text:
            return LayerModel.self
        }
    }
}

enum BlendMode: Int, Codable {
    case normal
    case multiply
    case screen
    case overlay
    case darken
    case lighten
    case colorDodge
    case colorBurn
    case hardLight
    case softLight
    case difference
    case exclusion
    case hue
    case saturation
    case color
    case luminosity
}

class LayerModel: Codable {
    
    /// The readable name of the layer
    let name: String
    
    /// The index of the layer
    let index: Int
    
    /// The type of the layer.
    let type: LayerType
    
    /// The coordinate space
    let coordinateSpace: CoordinateSpace
    
    /// The in time of the layer in frames.
    let inFrame: Double
    
    /// The out time of the layer in frames.
    let outFrame: Double
    
    /// The start time of the layer in frames.
    let startTime: Double
    
    /// The blending mode for the layer
    let blendMode: BlendMode
    
    /// A number that stretches time by a multiplier
    let timeStretch: Double
    
    
    let hidden: Bool

    private enum CodingKeys: String, CodingKey {
        case name = "nm"
        case index = "ind"
        case type = "ty"
        case coordinateSpace = "ddd"
        case inFrame = "ip"
        case outFrame = "op"
        case startTime = "st"
        case blendMode = "bm"
        case timeStretch = "sr"
        case hidden = "hd"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.index = try container.decode(Int.self, forKey: .index)
        self.type = try container.decode(LayerType.self, forKey: .type)
        self.coordinateSpace = try container.decode(CoordinateSpace.self, forKey: .coordinateSpace)
        self.inFrame = try container.decode(Double.self, forKey: .inFrame)
        self.outFrame = try container.decode(Double.self, forKey: .outFrame)
        self.startTime = try container.decode(Double.self, forKey: .startTime)
        self.blendMode = try container.decode(BlendMode.self, forKey: .blendMode)
        self.timeStretch = try container.decode(Double.self, forKey: .timeStretch)
        self.hidden = try container.decode(Bool.self, forKey: .hidden)
    }
}
