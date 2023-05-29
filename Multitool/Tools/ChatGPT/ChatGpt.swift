import SwiftUI
import ScrechKit

struct ChatGpt: View {
    @ObservedObject private var vm = ChatGptVM()
    
    var body: some View {
        VStack {
            TextField("Send a message", text: $vm.text)
                .multilineTextAlignment(.center)
        }
        .navigationTitle("ChatGPT")
    }
}

struct ChatGpt_Previews: PreviewProvider {
    static var previews: some View {
        Preview {
            ChatGpt()
        }
    }
}
