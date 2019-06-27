import SwiftUI


public struct LottieSwiftUI : UIViewRepresentable {
    var text = "Hello, World!"
    public init() {}
    public func makeUIView(context: Context) -> AnimationView {
        AnimationView(name: "home")
    }
    
    public func updateUIView(_ uiView: AnimationView, context: UIViewRepresentableContext<LottieSwiftUI>) {
        uiView.play()
    }
//    public var body: some View {
//    }
}
