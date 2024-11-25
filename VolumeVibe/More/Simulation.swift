import SwiftUI
import AVFoundation

struct Simulation: View {
    @StateObject private var viewModel = VolumeViewModel()
    @State private var isPlaying = false
    @State private var showAlert_1 = false
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
        Spacer()
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
        Spacer()
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
            
        })
        Spacer().frame(maxHeight: 20)
    }
}
