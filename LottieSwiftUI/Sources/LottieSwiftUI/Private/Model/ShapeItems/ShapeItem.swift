//
//  ShapeItem.swift
//  Hupo
//
//  Created by zhangyu528 on 2019/6/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import Foundation

enum PathDirection: Int, Codable {
    case clockwise = 1
    case userSetClockwise = 2
    case counterClockwise = 3
}

/// Used for mapping a heterogeneous list to classes for parsing.
extension ShapeType: ClassFamily {
    
    static var discriminator: Discriminator = .type
    
    func getType() -> AnyObject.Type {
        switch self {
        case .ellipse:
            return Ellipse.self
        case .fill:
            return Fill.self
        case .gradientFill:
            return GradientFill.self
        case .group:
            return Group.self
        case .gradientStroke:
            return GradientStroke.self
        case .merge:
            return Merge.self
        case .rectangle:
            return Rectangle.self
        case .repeater:
            return Repeater.self
        case .shape:
            return Shape.self
        case .star:
            return Star.self
        case .stroke:
            return Stroke.self
        case .trim:
            return Trim.self
        case .transform:
            return ShapeTransform.self
        default:
            return ShapeItem.self
        }
    }
}

enum ShapeType: String, Codable {
    case ellipse = "el"
    case fill = "fl"
    case gradientFill = "gf"
    case group = "gr"
    case gradientStroke = "gs"
    case merge = "mm"
    case rectangle = "rc"
    case repeater = "rp"
    case round = "rd"
    case shape = "sh"
    case star = "sr"
    case stroke = "st"
    case trim = "tm"
    case transform = "tr"
}

class ShapeItem: Codable {
    
    /// The name of the shape
    let name: String
    
    /// The type of shape
    let type: ShapeType
    
    let hidden: Bool
    
    private enum CodingKeys : String, CodingKey {
        case name = "nm"
        case type = "ty"
        case hidden = "hd"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(ShapeType.self, forKey: .type)
        self.hidden = try container.decode(Bool.self, forKey: .hidden)
    }
}
