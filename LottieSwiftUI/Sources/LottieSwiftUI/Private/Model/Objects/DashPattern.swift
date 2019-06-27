//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

enum DashElementType: String, Codable {
    case offset = "o"
    case dash = "d"
    case gap = "g"
}

struct DashElement: Codable {
    let type: DashElementType
    let value: KeyframeGroup<Vector1D>
    
    enum CodingKeys : String, CodingKey {
        case type = "n"
        case value = "v"
    }
}
