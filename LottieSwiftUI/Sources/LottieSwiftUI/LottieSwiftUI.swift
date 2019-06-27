import SwiftUI

public struct LottieSwiftUI {
    var text = "Hello, World!"
}

public struct LottieAnimationView : UIViewRepresentable {

    let animationView: AnimationView
    
    /**
     Loads a Lottie animation from a JSON file in the supplied bundle.
     
     - Parameter name: The string name of the lottie animation with no file
     extension provided.
     - Parameter bundle: The bundle in which the animation is located.
     Defaults to the Main bundle.
     - Parameter imageProvider: An image provider for the animation's image data.
     If none is supplied Lottie will search in the supplied bundle for images.
     */
    public init(name: String,
                bundle: Bundle = Bundle.main,
                imageProvider: AnimationImageProvider? = nil,
                animationCache: AnimationCacheProvider? = nil) {
        self.animationView = AnimationView(name: name, bundle: bundle, imageProvider: imageProvider, animationCache: animationCache)
    }
    
    /**
     Loads a Lottie animation from a JSON file in a specific path on disk.
     
     - Parameter name: The absolute path of the Lottie Animation.
     - Parameter imageProvider: An image provider for the animation's image data.
     If none is supplied Lottie will search in the supplied filepath for images.
     */
    public init(filePath: String,
                imageProvider: AnimationImageProvider? = nil,
                animationCache: AnimationCacheProvider? = nil) {
        self.animationView = AnimationView(filePath: filePath, imageProvider: imageProvider, animationCache: animationCache)
    }
    
    /**
     Loads a Lottie animation asynchronously from the URL
     
     - Parameter url: The url to load the animation from.
     - Parameter imageProvider: An image provider for the animation's image data.
     If none is supplied Lottie will search in the main bundle for images.
     - Parameter closure: A closure to be called when the animation has loaded.
     */
    public init(url: URL,
                imageProvider: AnimationImageProvider? = nil,
                animationCache: AnimationCacheProvider? = nil,
                closure: @escaping AnimationView.DownloadClosure) {
        self.animationView = AnimationView(url: url, imageProvider: imageProvider, closure: closure, animationCache: animationCache)
    }
    
    /**
     Plays the animation from its current state to the end.
     
     - Parameter completion: An optional completion closure to be called when the animation completes playing.
     */
    public func play(completion: LottieCompletionBlock? = nil) -> LottieAnimationView {
        self.animationView.play(completion: completion)
        return self
    }
    
    public func makeUIView(context: UIViewRepresentableContext<LottieAnimationView>) -> AnimationView {
        self.animationView
    }
    
    
    public func updateUIView(_ uiView: AnimationView, context: UIViewRepresentableContext<LottieAnimationView>) {
    }
}
