//
//  AnimationView.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation

final public class AnimationView: LottieView {
    
    var animation: Animation?
    var animationLayer: AnimationContainer?
    
    init(animation: Animation?) {
        self.animation = animation

        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeAnimationLayer() {
        
        guard let animation = animation else {
            return
        }
        
        let animationLayer = AnimationContainer(animation: animation)
        viewLayer.addSublayer(animationLayer)
        self.animationLayer = animationLayer
    }
}
