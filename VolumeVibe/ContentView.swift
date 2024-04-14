//
//  ContentView.swift
//  VolumeVibe
//
//  Created by 谢泽钰 on 2024/4/14.
//

import AVFoundation
import MediaPlayer
import SwiftUI

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
        // 在此处执行音量更改后的操作
    }

    func stopObservingVolume() {
        volumeObservation = nil
    }

    deinit {
        stopObservingVolume()
    }
}

struct ContentView: View {
    @State private var volume = 0

    private var listener = VolumeListener { _volume in
        print(_volume)
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
