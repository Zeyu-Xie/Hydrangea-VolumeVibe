//
//  ContentView.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/14.
//

import AVFoundation
import MediaPlayer
import SwiftUI

struct ContentView: View {
    @State private var volume = 0

    private var listener = VolumeListener { _volume in
        print(_volume)
    }
    
    init() {
        setSysVolum(0.002)
    }

    var body: some View {
        VStack {
            Image(systemName: "info.circle").font(.system(size: 50)).foregroundStyle(.red)
            Spacer().frame(maxHeight: 20)
            Text("VolumeVibe").bold().font(.title3)
            Text("Acan Xie").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("Version 1.0.0").foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
