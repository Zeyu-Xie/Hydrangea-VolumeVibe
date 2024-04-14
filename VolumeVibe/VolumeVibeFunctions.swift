//
//  VolumeVibeFunctions.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/14.
//

import Foundation
import MediaPlayer

func setSysVolum(_ value: Float) {
    let volumeView = MPVolumeView()
    if let view = volumeView.subviews.first as? UISlider {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            view.value = value
        }
    }
}

class VolumeListener: NSObject {
    private var audioSession: AVAudioSession!
    private var volumeObservation: NSKeyValueObservation?

    private var volumeDidChange: (_ volume: Float) -> Void // 音量变化通知函数

    init(volumeDidChange: @escaping (_ volume: Float) -> Void) {
        self.volumeDidChange = volumeDidChange
        super.init()
        setupAudioSession()
    }

    private func setupAudioSession() {
        audioSession = AVAudioSession.sharedInstance()

        do {
            try audioSession.setActive(true, options: [])
        } catch {
            print("Failed to activate audio session: \(error)")
            return
        }

        startObservingVolume()
    }

    private func startObservingVolume() {
        volumeObservation = audioSession.observe(\.outputVolume, options: [.initial, .new]) { [weak self] audioSession, _ in
            let currentVolume = audioSession.outputVolume
            self?.volumeDidChange(currentVolume)
        }
    }

    func volumeDidChange(volume: Float) {
        print("Volume did change: \(volume)")
    }

    func stopObservingVolume() {
        volumeObservation = nil
    }

    deinit {
        stopObservingVolume()
    }
}
