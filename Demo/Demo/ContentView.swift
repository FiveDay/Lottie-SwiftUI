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
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LottieSwiftUI()
    }
}
#endif
