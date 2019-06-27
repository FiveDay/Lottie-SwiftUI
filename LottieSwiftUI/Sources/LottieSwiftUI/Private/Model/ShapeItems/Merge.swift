//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

enum MergeMode: Int, Codable {
    case none
    case merge
    case add
    case subtract
    case intersect
    case exclude
}

class Merge: ShapeItem {
    
    /// The mode of the merge path
    let mode: MergeMode
    
    private enum CodingKeys : String, CodingKey {
        case mode = "mm"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Merge.CodingKeys.self)
        self.mode = try container.decode(MergeMode.self, forKey: .mode)
        try super.init(from: decoder)
    }
}
