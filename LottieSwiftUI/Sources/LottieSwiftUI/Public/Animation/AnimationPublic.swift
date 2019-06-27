//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation
import CoreGraphics

extension Animation {
    
    static func named(name: String) -> Animation? {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            return nil
        }
        do {
            let json = try Data(contentsOf: url)
            let animation = try JSONDecoder().decode(Animation.self, from: json)
            return animation
        } catch {
            return nil
        }
    }
    // MARK: Animation (Helpers)

    /**
     Markers are a way to describe a point in time by a key name.
     
     Markers are encoded into animation JSON. By using markers a designer can mark
     playback points for a developer to use without having to worry about keeping
     track of animation frames. If the animation file is updated, the developer
     does not need to update playback code.
     
     Returns the Frame Time for the marker named. Returns nil if no marker found.
     */
//    func progressTime(forMarker named: String) -> AnimationProgressTime? {
//        guard let markers = markerMap, let marker = markers[named] else {
//            return nil
//        }
//        return progressTime(forFrame: marker.frameTime)
//    }
    
    /**
     Markers are a way to describe a point in time by a key name.
     
     Markers are encoded into animation JSON. By using markers a designer can mark
     playback points for a developer to use without having to worry about keeping
     track of animation frames. If the animation file is updated, the developer
     does not need to update playback code.
     
     Returns the Frame Time for the marker named. Returns nil if no marker found.
     */
//    func frameTime(forMarker named: String) -> AnimationFrameTime? {
//        guard let markers = markerMap, let marker = markers[named] else {
//            return nil
//        }
//        return marker.frameTime
//    }
    
    /// Converts Frame Time (Seconds * Framerate) into Progress Time (0 to 1).
//    func progressTime(forFrame frameTime: AnimationFrameTime) -> AnimationProgressTime {
//        return ((frameTime - startFrame) / (endFrame - startFrame)).clamp(0, 1)
//    }
    
    /// Converts Time (Seconds) into Frame Time (Seconds * Framerate)
//    func frameTime(forTime time: TimeInterval) -> AnimationFrameTime {
//        return CGFloat(time * framerate) + startFrame
//    }
    
    /// The duration in seconds of the animation.
//    var duration: TimeInterval {
//        return Double(endFrame - startFrame) / framerate
//    }
    
    /// The natural bounds in points of the animation.
    var bounds: CGRect {
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    /// The natural size in points of the animation.
    var size: CGSize {
        return CGSize(width: width, height: height)
    }
}
