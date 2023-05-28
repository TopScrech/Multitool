import SwiftUI

class UserSettings: ObservableObject {
    @AppStorage("apiKeyGpt") var apiKeyGpt: String = ""
    @AppStorage("isApiKeyGptValid") var isApiKeyGptValid: Bool = false
}
