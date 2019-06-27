//
//  Trim.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

enum TrimType: Int, Codable {
    case simultaneously = 1
    case individually = 2
}

/// An item that define an ellipse shape
class Trim: ShapeItem {
    
    /// The start of the trim
    let start: KeyframeGroup<Vector1D>
    
    /// The end of the trim
    let end: KeyframeGroup<Vector1D>
    
    /// The offset of the trim
    let offset: KeyframeGroup<Vector1D>
    
    let trimType: TrimType
    
    enum CodingKeys: String, CodingKey {
        case start = "s"
        case end = "e"
        case offset = "o"
        case trimType = "m"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Trim.CodingKeys.self)
        self.start = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .start)
        self.end = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .end)
        self.offset = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .offset)
        self.trimType = try container.decode(TrimType.self, forKey: .trimType)
        try super.init(from: decoder)
    }
}
