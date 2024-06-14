import SwiftUI

struct Ratings: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(content: {
            ratingsFunction()
        })
    }
    
    func ratingsFunction() -> some View {
        if let appStoreUrl = URL(string: "itms-apps://itunes.apple.com/app/id6499372355") {
            UIApplication.shared.open(appStoreUrl, options: [:], completionHandler: nil)
        }
        presentationMode.wrappedValue.dismiss()
        return Spacer().frame(maxWidth: 0)
    }
}
