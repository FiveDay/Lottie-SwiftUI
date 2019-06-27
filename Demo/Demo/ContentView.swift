//
//  ContentView.swift
//  Demo
//
//  Created by zhangyu528 on 2019/6/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

import SwiftUI
import LottieSwiftUI

struct ContentView : View {
    var name: String = "LottieLogo1"
    var body: some View {
        LottieAnimationView(name: name)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(name: "LottieLogo2")
            ContentView(name: "LottieLogo1")
        }.previewDevice("iPhone Xʀ")
    }
}
#endif
