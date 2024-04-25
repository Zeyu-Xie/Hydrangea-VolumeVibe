import SwiftUI
import AVFoundation

struct Simulation: View {
    @State private var isPlaying = false
    private var audioPlayer: AVAudioPlayer?

    init() {
        if let audioURL = Bundle.main.url(forResource: "Castle in the Sky", withExtension: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        } else {
            print("Error: Audio file not found.")
        }
    }

    var body: some View {
        VStack {
            Button(action: {
                if self.isPlaying {
                    self.audioPlayer?.pause()
                } else {
                    self.audioPlayer?.play()
                }
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
        }
    }
}
