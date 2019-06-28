# Lottie-SwiftUI
* 支持SwiftUI预览Lottie动画

## Requirements
* iOS13.0 or later

## Install
### Carthage

Add Lottie to your Cartfile:

github "FiveDay/Lottie-Swift" "master"
And then run:

carthage update

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
