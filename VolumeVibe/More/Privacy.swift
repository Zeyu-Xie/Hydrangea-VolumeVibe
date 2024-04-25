import SwiftUI

struct Privacy: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Privacy Policy")
                    .font(.title)
                    .fontWeight(.bold)
                Text("This Privacy Policy describes how I, Acan Xie, handle information collected from users of my iOS mobile application (the \"App\").")
                    .font(.body)
                
                Text("Information I Do Not Collect")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("I do not collect any personal information or user data through the App. This includes but is not limited to:")
                    .font(.body)
                VStack(alignment: .leading, spacing: 8) {
                    Text("- Name")
                    Text("- Email address")
                    Text("- Phone number")
                    Text("- Device information")
                    Text("- Usage data")
                }
                
                Text("Third-Party Services")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("I do not integrate any third-party services that collect user data or personal information within my App.")
                    .font(.body)
                
                Text("Changes to This Privacy Policy")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("I may update this Privacy Policy from time to time. Any changes will be reflected in the App's updated Privacy Policy.")
                    .font(.body)
                
                Text("Contact Me")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("If you have any questions about this Privacy Policy, please contact me at xie.zeyu20@gmail.com.")
                    .font(.body)
            }
            .padding()
        }
    }
}
