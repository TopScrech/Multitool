import SwiftUI

struct AppContainer: View {
    @StateObject private var userSettings = UserSettings()
    
    var body: some View {
        NavigationStack {
            HomeView()
        }
        .environmentObject(userSettings)
    }
}
