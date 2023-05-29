import SwiftUI

class UserSettings: ObservableObject {
    @AppStorage("apiKeyGpt") var apiKeyGpt = ""
    @AppStorage("isApiKeyGptValid") var isApiKeyGptValid = false
}
