import SwiftUI

struct HomeButton: View {
    let name, image: String
    
    init(_ name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(16)
                .padding(3)
                .background(Color.white.cornerRadius(16))
            
            Text(name)
                .bold()
                .footnote()
                .foregroundColor(Color("theme"))
        }
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton("ChatGPT", image: "OpenAI")
            .darkSchemePreferred()
    }
}
