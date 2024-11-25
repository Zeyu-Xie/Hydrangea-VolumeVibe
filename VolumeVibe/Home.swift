//
//  Home.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/25.
//

import Foundation
import SwiftUI

struct Home: View {
    
    @StateObject private var viewModel = VolumeViewModel()
    @State private var showAlert_1 = false
    
    @AppStorage("quickVolumeValue") var quickVolumeValue : Double?
    
    var body: some View {
        
        VStack {
            Image(systemName: "speaker.wave.2.circle").font(.system(size: 60)).foregroundStyle(.blue)
            Spacer().frame(maxHeight: 20)
            Text("VolumeVibe").bold().font(.title3)
            Text("Acan Xie").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("Version \((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!)").foregroundStyle(.secondary)
            Text("iOS" + " " + UIDevice.current.systemVersion).foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("Press and Set Volume as \(formattedValue(value: quickVolumeValue ?? 0.1)).").foregroundStyle(.secondary)
            
            Spacer().frame(maxHeight: 20)
            
            Button(action: {
                setSysVolum(Float(0.01*(quickVolumeValue ?? 0.1)))
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
            HStack(alignment: .center, content: {
                Text("Current Volume: About \(formattedValue(value: 100*Double(viewModel.currentVolume)))").foregroundStyle(.secondary).font(.subheadline)
                Image(systemName: "questionmark.circle").resizable().frame(width: 12, height: 12).foregroundStyle(.secondary).onTapGesture {
                    showAlert_1 = true
                }.alert(isPresented: $showAlert_1) {
                    Alert(
                        title: Text("Attention"),
                        message: Text("Due to Apple's API limitations, it is not possible to display precise volume numbers in this context."),
                        dismissButton: .default(Text("Got It"))
                    )
                }
                
            }).padding(0)
            
            Spacer().frame(maxHeight: 20)
            Text("Note: this app may not work on iOS versions earlier than 15.0.").foregroundStyle(.secondary).font(.subheadline)
            
        }.padding(.horizontal, 40).frame(maxHeight: .infinity, alignment: .center).multilineTextAlignment(.center)
    }
}
