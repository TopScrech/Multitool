import SwiftUI

struct Container: View {
    @StateObject private var vm = ContainerVM()
    
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Главнвая", systemImage: "house.fill")
                    }
                
                DictionaryView()
                    .badge(vm.dictionaryHome.count)
                    .tabItem {
                        Label("На изучении", systemImage: "character.book.closed.fill")
                    }
                
                DictionaryPlusView()
                    .badge(vm.anotherDictionary.count)
                    .tabItem {
                        Label("Архив", systemImage: "text.book.closed.fill")
                    }
            }
            .environmentObject(vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container()
            .environmentObject(ContainerVM())
    }
}
