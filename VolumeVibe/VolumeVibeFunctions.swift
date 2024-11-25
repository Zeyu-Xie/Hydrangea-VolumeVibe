//
//  VolumeVibeFunctions.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/14.
//

import Foundation
import MediaPlayer
import AVFoundation
import Combine
import SwiftUI

func setSysVolum(_ value: Float) {
    let volumeView = MPVolumeView()
    if let view = volumeView.subviews.first as? UISlider {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            view.value = value
        }
    }
}

class VolumeViewModel: ObservableObject {
    @Published var currentVolume: Float = 0.0
    
    private var cancellable: AnyCancellable?

    init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(true)
            self.cancellable = audioSession.publisher(for: \.outputVolume)
                .sink { [weak self] volume in
                    self?.currentVolume = volume
                }
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
}

func formattedValue(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
    return formatter.string(from: NSNumber(value: value))?.replacingOccurrences(of: ",", with: ".") ?? ""
    }

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 80)
    }
}
