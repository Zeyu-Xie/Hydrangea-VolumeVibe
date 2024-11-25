import SwiftUI

struct Settings: View {
    
    @State private var volumeInput: String = ""
    
    var body: some View {
        List {
            Section {
                NavigationLink(destination: QuickVolumeValue().navigationBarTitle("Quick Volume Value", displayMode: .inline)) {
                    Label("Quick Volume Value", systemImage: "speaker.wave.2")
                }            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
