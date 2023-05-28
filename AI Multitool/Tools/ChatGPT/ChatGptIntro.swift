import SwiftUI

struct ChatGptIntro: View {
    @ObservedObject private var vm = ChatGptIntroVM()
    
    @State private var apiKey: String = ""
    
    var body: some View {
        VStack {
            Text("Enter yout API-key")
            
            TextField("API-key", text: $apiKey)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
                vm.validateApiKey(apiKey)
            } label: {
                Text("Save")
            }
        }
    }
}

struct ChatGptIntro_Previews: PreviewProvider {
    static var previews: some View {
        ChatGptIntro()
            .darkSchemePreferred()
    }
}
