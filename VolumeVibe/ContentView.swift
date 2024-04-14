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
    
    @State private var accurate:Bool = false
    
    var body: some View {
        Spacer()
        VStack(alignment: .center) {
            if(accurate) {
                ContentView_2()
            } else {
                ContentView_1()
            }
        }
        Spacer()
        VStack(alignment: .center) {
            Button(action: {
                accurate = !accurate
            }) {
                accurate ? Text("Back") : Text("Other Volumes")
            }
        }.padding()
    }
}

struct ContentView_1: View {
//    @State private var volume:Double = 0
    @State private var version:String = "NULL"

    private var listener = VolumeListener { _volume in print("Volume Changed to \(_volume)")
    }
    
    private func setVersion(_ vs: String) {
            version = vs
    }
    
    var body: some View {
        VStack {
            Image(systemName: "speaker.wave.2.circle").font(.system(size: 60)).foregroundStyle(.blue)
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
                if #available(iOS 16.0, *) {
                    Text("Set Volume")
                        .frame(maxWidth: .infinity)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(12)
                        .background(.blue)
                        .cornerRadius(10)
                } else {
                    Text("Set Volume")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .padding(12)
                        .background(.blue)
                        .cornerRadius(10)
                }
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

struct ContentView_2: View {
    
    @State private var vo:String = ""
    
    var body: some View {
        VStack(alignment: .center, content: {
            Image(systemName: "speaker.wave.2.circle").font(.system(size: 60)).foregroundStyle(.blue)
            Spacer().frame(maxHeight: 20)
            Text("VolumeVibe").font(.title3).bold()
            Text("Acan Xie").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("You can input a value between 0 and 1, remember only typing numbers (0~9) and a dot.").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 20)
            TextField( "Enter Text", text: $vo).padding()
                .background(Color.primary.opacity(0.1)) // 设置背景颜色
                .cornerRadius(10) // 设置圆角
                .padding().keyboardType(.decimalPad)
            Spacer().frame(maxHeight: 0)
            Button(action: {
                let vo_num:Float = Float(vo.replacingOccurrences(of: ",", with: ".")) ?? -1
                if(vo_num >= 0) {
                    setSysVolum(Float(vo_num))
                }
            }) {
                Text("Set Volume")
            }
        }).padding(40).frame(alignment: .center).multilineTextAlignment(.center).onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}


#Preview {
    ContentView()
}
