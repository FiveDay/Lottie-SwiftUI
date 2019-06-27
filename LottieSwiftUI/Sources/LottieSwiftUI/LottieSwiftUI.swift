import SwiftUI

public struct LottieSwiftUI {
    var text = "Hello, World!"
}

public struct LottieAnimationView : UIViewRepresentable {
    
    let name: String
    
    public init(name: String) {
        self.name = name
    }

    public func makeUIView(context: UIViewRepresentableContext<LottieAnimationView>) -> AnimationView {
        AnimationView(name: self.name)
    }
    
    public func updateUIView(_ uiView: AnimationView, context: UIViewRepresentableContext<LottieAnimationView>) {
        uiView.play()
    }
}
