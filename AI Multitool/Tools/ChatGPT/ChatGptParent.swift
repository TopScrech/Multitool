import SwiftUI

struct ChatGptParent: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
//            if userSettings.isApiKeyGptValid {
                ChatGpt()
//            } else {
//
//            }
        }
    }
}

struct ChatGptParent_Previews: PreviewProvider {
    static var previews: some View {
        ChatGptParent()
            .environmentObject(UserSettings())
    }
}
