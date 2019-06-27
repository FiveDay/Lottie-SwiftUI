//
//  Animation.swift
//  Hupo
//
//  Created by zhangyu528 on 2019/6/20.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import Foundation

enum CoordinateSpace: Int, Codable {
    case type2d
    case type3d
}


/**
 The `Animation` model is the top level model object in Lottie.
 
 An `Animation` holds all of the animation data backing a Lottie Animation.
 Codable, see JSON schema [here](https://github.com/airbnb/lottie-web/tree/master/docs/json).
 */
class Animation: Codable {
    
    //Bodymovin Version
    let version: String
    
    //Composition name
    let name: String
    
    //Composition has 3-D layers
    let type: CoordinateSpace
    
    //Frame Rate
    let frameRate: Double
    
    //In Point of the Time Ruler. Sets the initial Frame of the animation.
    let startFrame: AnimationFrameTime
    
    //Out Point of the Time Ruler. Sets the final Frame of the animation.
    let endFrame: AnimationFrameTime
    
    //Composition Width
    let width: Int
    
    //Composition Height
    let height: Int
    
    //List of Composition Layers
    let layers: [LayerModel]
    
    enum CodingKeys: String, CodingKey {
        case version = "v"
        case frameRate = "fr"
        case startFrame = "ip"
        case endFrame = "op"
        case width = "w"
        case height = "h"
        case name = "nm"
        case type = "ddd"
        case layers = "layers"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.version = try container.decode(String.self, forKey: .version)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(CoordinateSpace.self, forKey: .type)
        self.frameRate = try container.decode(Double.self, forKey: .frameRate)
        self.startFrame = try container.decode(AnimationFrameTime.self, forKey: .startFrame)
        self.endFrame = try container.decode(AnimationFrameTime.self, forKey: .endFrame)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
        
        self.layers = try container.decode([LayerModel].self, ofFamily: LayerType.self, forKey: .layers)
    }
}
