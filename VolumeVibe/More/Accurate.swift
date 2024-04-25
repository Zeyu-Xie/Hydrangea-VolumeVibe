//
//  Accurate.swift
//  VolumeVibe
//
//  Created by Acan Xie on 2024/4/25.
//

import SwiftUI

struct Accurate: View {
    
    @State private var volumeInput: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "speaker.wave.2.circle")
                .font(.system(size: 60))
                .foregroundStyle(.blue)
            
            Text("VolumeVibe")
                .font(.title3)
                .bold()
            
            Text("Acan Xie")
                .foregroundStyle(.secondary)
            
            Text("Input a value between 0 and 1.")
                .foregroundStyle(.secondary)
            
            TextField("Enter Volume", text: $volumeInput)
                .padding(8)
                .background(Color.white)
                .cornerRadius(10)
                .keyboardType(.decimalPad)
            
            Button(action: {
                setSysVolum(Float(volumeInput.replacingOccurrences(of: ",", with: "."))!)
            }) {
                Text("Set Volume")
            }
            .buttonStyle(FilledButtonStyle())
            
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color(.systemGray6).ignoresSafeArea())
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? Color.blue.opacity(0.8) : Color.blue)
            .cornerRadius(10)
    }
}


////
////  Accurate.swift
////  VolumeVibe
////
////  Created by 谢泽钰 on 2024/4/25.
////
//
//import Foundation
//import SwiftUI
//
//struct Accurate: View {
//    
//    @State private var vo:String = ""
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "speaker.wave.2.circle").font(.system(size: 60)).foregroundStyle(.blue)
//            Spacer().frame(maxHeight: 20)
//            Text("VolumeVibe").font(.title3).bold()
//            Text("Acan Xie").foregroundStyle(.secondary)
//            Spacer().frame(maxHeight: 30)
//            Text("Input a value between 0 and 1.").foregroundStyle(.secondary)
//            Spacer().frame(maxHeight: 20)
//            TextField( "", text: $vo).padding(8)
//                .background(.white) // 设置背景颜色
//                .cornerRadius(10) // 设置圆角
//                .padding().keyboardType(.decimalPad)
//            Spacer().frame(maxHeight: 0)
//            Button(action: {
//                let vo_num:Float = Float(vo.replacingOccurrences(of: ",", with: ".")) ?? -1
//                if(vo_num >= 0) {
//                    setSysVolum(Float(vo_num))
//                }
//            }) {
//                Text("Set Volume")
//            }
//        }
//        .frame(maxHeight: .infinity, alignment: .center)
//        .multilineTextAlignment(.center)
//        .onTapGesture {
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        }
//        .background(Color(.systemGray6))
//        
//    }
//}
