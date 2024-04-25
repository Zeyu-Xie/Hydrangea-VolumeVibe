import SwiftUI

struct About: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hydrangea VolumeVibe")
                .font(.title)
                .fontWeight(.bold)
            Text("Version \((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!) on iOS \(UIDevice.current.systemVersion)")
                .font(.subheadline).foregroundStyle(.secondary)
            Text("Features:")
                .font(.headline)
                .fontWeight(.bold)
            VStack(alignment: .leading, spacing: 8, content: {
                Text("- Utilize Sound Value Precisely")
                Text("- Other Functions")
            })
            Text("Contact Us:")
                .font(.headline)
                .fontWeight(.bold)
            Text("Email: xie.zeyu20@gmail.com")
            Text("Copyright:")
                .font(.headline)
                .fontWeight(.bold)
            Text("© 2024 Hydrangea VolumeVibe. All rights reserved.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
        }
        .padding()
    }
}
