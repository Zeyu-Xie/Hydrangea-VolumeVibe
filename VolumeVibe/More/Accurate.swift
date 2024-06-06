import SwiftUI

struct Accurate: View {
    
    @State private var volumeInput: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "speaker.wave.2.circle")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("VolumeVibe")
                .font(.title3)
                .bold()
            
            Text("Acan Xie")
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, content: {
                Text("On Apple devices, the volume value typically ranges from 0 to 1. However, in this app the range is 0.0 to 100.0, which is believed to be more intuitive.").foregroundStyle(.secondary).multilineTextAlignment(.leading)
                Spacer().frame(maxHeight: 20)
                Text("This range allows for precise control over the audio output level. It's important to note that values outside this range might not have any effect on the actual volume level.").foregroundStyle(.secondary).multilineTextAlignment(.leading)
                Spacer().frame(maxHeight: 20)
                Text("Additionally, some devices might have slightly different behavior or additional features related to volume control.")
                    .foregroundColor(.secondary).multilineTextAlignment(.leading)
            })
            
            TextField("Set Volume 0.0 - 100.0", text: $volumeInput)
                .padding(12)
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Text("Volume")                            .padding(.horizontal, 20)
                        Spacer()
                    }
                )
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.leading)
                .textFieldStyle(CustomTextFieldStyle())
            
            
            
            Button(action: {
                if let volume = Float(volumeInput.replacingOccurrences(of: ",", with: ".")) {
                    let sysVolume = volume * 0.01
                    setSysVolum(sysVolume)
                }
            }) {
                Text("Set Volume")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color(UIColor.systemGray6).ignoresSafeArea())
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
