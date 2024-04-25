//
//  Cards.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/25.
//

import Foundation
import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            // Card background
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 300, height: 200)
            
            // Card content
            VStack {
                Text("Card Title")
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
                Text("Card Description")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}
