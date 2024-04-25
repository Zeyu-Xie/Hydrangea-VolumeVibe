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
            Text("Press and Set Volume as 0.001").foregroundStyle(.secondary)
            
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
            Text("Current Volume: \(formattedValue(value: Double(viewModel.currentVolume)))").foregroundStyle(.secondary).font(.subheadline)
            Spacer().frame(maxHeight: 20)
            Text("Note: this app may not work on iOS versions earlier than 15.0.").foregroundStyle(.secondary).font(.subheadline)
            
        }.padding(.horizontal, 40).frame(maxHeight: .infinity, alignment: .center).multilineTextAlignment(.center).background(Color(.systemGray6))
    }
    
    private func formattedValue(value: Double) -> String {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 4
            formatter.maximumFractionDigits = 4
            return formatter.string(from: NSNumber(value: value)) ?? ""
        }
}
