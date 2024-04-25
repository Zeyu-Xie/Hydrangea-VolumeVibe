//
//  More.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/25.
//

import Foundation
import SwiftUI

struct More: View {
        
    @State private var vo:String = ""
    
    var body: some View {
        VStack(alignment: .center, content: {
            Image(systemName: "speaker.wave.2.circle").font(.system(size: 60)).foregroundStyle(.blue)
            Spacer().frame(maxHeight: 20)
            Text("VolumeVibe").font(.title3).bold()
            Text("Acan Xie").foregroundStyle(.secondary)
            Spacer().frame(maxHeight: 30)
            Text("Input a value between 0 and 1.").foregroundStyle(.secondary)
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
