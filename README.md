# Lottie-SwiftUI
* 支持SwiftUI预览Lottie动画

## Requirements
* iOS13.0 or later

## Install
### Swift Packages

1. In Xcode, open your project and navigate to File > Swift Packages > Add Package Dependency...
2. Paste the repository URL and follow the prompts to add the library to your project.

## Quick Start

    import SwiftUI
    import LottieSwiftUI

    struct ContentView : View {
        var name: String = "LottieLogo1"
        var body: some View {
            LottieAnimationView(name: name).play()
        }
    }
## Demo
![](https://github.com/FiveDay/Lottie-SwiftUI/blob/master/LottieLogo1.gif?raw=true)

![](https://github.com/FiveDay/Lottie-SwiftUI/blob/master/LottieLogo2.gif?raw=true)
