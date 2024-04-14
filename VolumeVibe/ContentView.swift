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
            Image(systemName: "info.circle").font(.system(size: 60)).foregroundStyle(.blue)
            Spacer().frame(maxHeight: 20)
            Text("VolumeVibe").bold().font(.title3)
            Text("Acan Xie").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("Version 1.0.0").foregroundStyle(.secondary)
            Text("iOS" + " " + UIDevice.current.systemVersion).foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("You can press the button to set the volume to 0.001.").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 20)
            Button(action: {
                setSysVolum(0.001)
            }) {
                Text("Click It")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(.blue)
                    .cornerRadius(10)
            }
            Spacer().frame(maxHeight: 20)
            Text("Note: this app may not work on early iOS versions.").foregroundStyle(.secondary).font(.subheadline)
        }.padding(40).frame(alignment: .center).multilineTextAlignment(.center)
    }
}

#Preview {
    ContentView()
}
