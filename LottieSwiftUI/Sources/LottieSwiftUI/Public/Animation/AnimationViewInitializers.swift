//
//  AnimationViewInitalizers.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

extension AnimationView {
    
    convenience init(name: String) {
        let animation = Animation.named(name: name)
        self.init(animation: animation)
    }
}
