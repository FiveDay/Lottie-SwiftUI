//
//  Fill.swift
//  Hupo
//
//  Created by zhangyu528 on 2019/6/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import Foundation

enum FillRule: Int, Codable {
    case none
    case nonZeroWinding
    case evenOdd
}

class Fill: ShapeItem {

    /// The opacity of the fill
    let opacity: KeyframeGroup<Vector1D>
    
    /// The color keyframes for the fill
    let color: KeyframeGroup<Color>
    
    let fillRule: FillRule

    private enum CodingKeys : String, CodingKey {
        case opacity = "o"
        case color = "c"
        case fillRule = "r"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Fill.CodingKeys.self)
        self.opacity = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .opacity)
        self.color = try container.decode(KeyframeGroup<Color>.self, forKey: .color)
        self.fillRule = try container.decodeIfPresent(FillRule.self, forKey: .fillRule) ?? .nonZeroWinding
        try super.init(from: decoder)
    }
}
