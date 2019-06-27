//
//  Vectors.swift
//  Hupo
//
//  Created by zhangyu528 on 2019/6/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import Foundation

struct Vector1D {
    
    public init(_ value: Double) {
        self.value = value
    }
    
    let value: Double
    
}


/**
 A three dimensional vector.
 These vectors are encoded and decoded from [Double]
 */
struct Vector3D {
    
    var x: Double
    var y: Double
    var z: Double
    
    public init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    
}
