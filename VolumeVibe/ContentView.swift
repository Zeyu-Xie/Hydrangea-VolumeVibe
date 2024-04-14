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
    @State private var volume:Double = 0
    @State private var version:String = "NULL"

    private var listener = VolumeListener { _volume in print("Volume Changed to \(_volume)")
    }
    
    private func setVersion(_ vs: String) {
            version = vs
    }
    
    var body: some View {
        VStack {
            Image(systemName: "info.circle").font(.system(size: 60)).foregroundStyle(.blue)
            Spacer().frame(maxHeight: 20)
            Text("VolumeVibe").bold().font(.title3)
            Text("Acan Xie").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("Version \(version)").foregroundStyle(.secondary)
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
            .onAppear() {
                
                guard let plistURL = Bundle.main.url(forResource: "config", withExtension: "plist") else {
                    print("Plist file not found.")
                    return
                }
                
                do {
                    // 加载plist文件数据
                    let plistData = try Data(contentsOf: plistURL)
                    
                    // 解析plist文件数据
                    guard let plistObject = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any] else {
                        print("Failed to parse plist file.")
                        return
                    }
                    
                    setVersion(plistObject["version"] as! String)
                } catch {
                    print("Error loading plist file: \(error)")
                }
            }
    }
}

#Preview {
    ContentView()
}
