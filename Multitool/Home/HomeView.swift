import SwiftUI

struct HomeView: View {
    private let buttons: [ToolButton] = [
        .init("ChatGPT", image: "OpenAI", destination: AnyView(ChatGptParent())),
    ]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible())]) {
            ForEach(buttons) { button in
                NavigationLink {
                    button.destination
                } label: {
                    HomeButton (
                        button.name,
                        image: button.image
                    )
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
