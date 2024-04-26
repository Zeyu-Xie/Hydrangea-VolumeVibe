import SwiftUI

struct Privacy: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Privacy Policy")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("This Privacy Policy describes how I, Acan Xie, handle information collected from users of my iOS mobile application (the \"App\").")
                    .font(.subheadline)
                
                Text("Information I Do Not Collect")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("I do not collect any personal information or user data through the App. This includes but is not limited to:")
                    .font(.subheadline)
                VStack(alignment: .leading, spacing: 6) {
                    Text("- Name").font(.subheadline)
                    Text("- Email address").font(.subheadline)
                    Text("- Phone number").font(.subheadline)
                    Text("- Device information").font(.subheadline)
                    Text("- Usage data").font(.subheadline)
                }
                
                Text("Third-Party Services")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("I do not integrate any third-party services that collect user data or personal information within my App.")
                    .font(.subheadline)
                
                Text("Changes to This Privacy Policy")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("I may update this Privacy Policy from time to time. Any changes will be reflected in the App's updated Privacy Policy.")
                    .font(.subheadline)
                
                Text("Contact Me")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("If you have any questions about this Privacy Policy, please contact me at xie.zeyu20@gmail.com.")
                    .font(.subheadline)
            }
            .padding()
        }
    }
}
