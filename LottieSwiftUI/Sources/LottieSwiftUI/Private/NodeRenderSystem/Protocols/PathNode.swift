//
//  PathNode.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

protocol PathNode {
    var pathOutput: PathOutputNode { get }
}

extension PathNode where Self: AnimatorNode {
    
    var outputNode: NodeOutput {
        return pathOutput
    }
    
}
