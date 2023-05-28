import SwiftUI

extension HomeView {
    struct ToolButton: Identifiable {
        let id = UUID()
        let name, image: String
        let destination: AnyView
        
        init(_ name: String, image: String, destination: AnyView = AnyView(EmptyView())) {
            self.name = name
            self.image = image
            self.destination = destination
        }
    }
}
