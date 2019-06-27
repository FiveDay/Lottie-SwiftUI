//
//  Group.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

/// An item that define an ellipse shape
class Group: ShapeItem {
    
    /// A list of shape items.
    let items: [ShapeItem]
    
    enum CodingKeys: String, CodingKey {
        case items = "it"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([ShapeItem].self, ofFamily: ShapeType.self, forKey: .items)
        try super.init(from: decoder)
    }
}
