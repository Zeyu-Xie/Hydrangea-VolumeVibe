import SwiftUI

struct Settings: View {
    
    @State private var volumeInput: String = ""
    
    var body: some View {
        List {
            Section {
                NavigationLink(destination: QuickVolumeValue().navigationBarTitle("About", displayMode: .inline)) {
                    Label("About", systemImage: "info.circle")
                }            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
