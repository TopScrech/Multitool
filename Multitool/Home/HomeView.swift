import SwiftUI
import ScrechKit

struct HomeView: View {
    private let buttons: [ToolButton] = [
        .init("ChatGPT", image: "OpenAI", destination: AnyView(ChatGptParent())),
        .init("Irregular Verbs", image: "Irregular Verbs", destination: AnyView(Container_Verbs())),
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
        Preview {
            HomeView()
        }
    }
}
