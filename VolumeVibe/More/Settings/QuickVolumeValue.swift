import SwiftUI

struct QuickVolumeValue: View {
    
    @State private var volumeInput: String = ""
    @State private var showAlert_2: Bool = false
    @State private var alert_title: String = ""
    @State private var alert_content: String = ""
    
    @AppStorage("quickVolumeValue") var quickVolumeValue : Double?
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Set the volume value that can be quickly adjusted on the homepage.").foregroundStyle(.secondary).multilineTextAlignment(.leading).font(.subheadline)
            
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
                    if(volume >= 0.0 && volume <= 100.0) {
                        quickVolumeValue = Double(volume)
                        showAlert_2 = true
                        alert_title = "Success"
                        alert_content = "Volume Successfully Set to \(formattedValue(value: Double(volume)))"
                    }
                    else {
                        showAlert_2 = true
                        alert_title = "Failed"
                        alert_content = "Only Support Volume with Value 0.0 to 100.0"
                    }
                }
                else {
                    showAlert_2 = true
                    alert_title = "Failed"
                    alert_content = "Wrong Format"
                }
            }) {
                Text("Set Volume")
            }
            
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color(UIColor.systemGray6).ignoresSafeArea())
        .onTapGesture {
            hideKeyboard()
        }.alert(isPresented: $showAlert_2) {
            Alert(
                title: Text(alert_title),
                message: Text(alert_content),
                dismissButton: .default(Text("Got It"))
            )
        }
    }
    
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
