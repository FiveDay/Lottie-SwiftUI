//
//  File.swift
//  
//
//  Created by zhangyu528 on 2019/6/23.
//

import Foundation


enum GradientType: Int, Codable {
    case none
    case linear
    case radial
}

class GradientFill: ShapeItem {
    /// The opacity of the fill
    let opacity: KeyframeGroup<Vector1D>
    
    /// The start of the gradient
    let startPoint: KeyframeGroup<Vector3D>
    
    /// The end of the gradient
    let endPoint: KeyframeGroup<Vector3D>
    
    /// The type of gradient
    let gradientType: GradientType
    
    /// Gradient Highlight Length. Only if type is Radial
    let highlightLength: KeyframeGroup<Vector1D>?
    
    /// Highlight Angle. Only if type is Radial
    let highlightAngle: KeyframeGroup<Vector1D>?
    
    /// The number of color points in the gradient
    let numberOfColors: Int
    
    /// The Colors of the gradient.
    let colors: KeyframeGroup<[Double]>
    
    private enum CodingKeys : String, CodingKey {
        case opacity = "o"
        case startPoint = "s"
        case endPoint = "e"
        case gradientType = "t"
        case highlightLength = "h"
        case highlightAngle = "a"
        case colors = "g"
    }
    
    private enum GradientDataKeys : String, CodingKey {
        case numberOfColors = "p"
        case colors = "k"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GradientFill.CodingKeys.self)
        self.opacity = try container.decode(KeyframeGroup<Vector1D>.self, forKey: .opacity)
        self.startPoint = try container.decode(KeyframeGroup<Vector3D>.self, forKey: .startPoint)
        self.endPoint = try container.decode(KeyframeGroup<Vector3D>.self, forKey: .endPoint)
        self.gradientType = try container.decode(GradientType.self, forKey: .gradientType)
        self.highlightLength = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .highlightLength)
        self.highlightAngle = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .highlightAngle)
        let colorsContainer = try container.nestedContainer(keyedBy: GradientDataKeys.self, forKey: .colors)
        self.colors = try colorsContainer.decode(KeyframeGroup<[Double]>.self, forKey: .colors)
        self.numberOfColors = try colorsContainer.decode(Int.self, forKey: .numberOfColors)
        try super.init(from: decoder)
    }
}
