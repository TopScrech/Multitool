import SwiftUI

struct DictionaryPlusView: View {
    @EnvironmentObject private var vm: ContainerVM
    
    var body: some View {
        VStack {
            VStack {
                Text("Архив глаголов")
                    .font(.headline)
                
                Text("Base form - past simple - past participle")
            }
            
            List(vm.anotherDictionary.sorted(by: <), id: \.key) { key, value in
                HStack {
                    Text(key)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text(value)
                        .multilineTextAlignment(.trailing)
                    
                    Image(systemName: "goforward.plus")
                        .foregroundColor(.green)
                        .onTapGesture {
                            vm.generator.selectionChanged()
                            vm.moveKeyValuePair(from: &vm.anotherDictionary, to: &vm.dictionaryHome, forKey: key)
                        }
                }
            }
            
            if vm.anotherDictionary.count == 0 {
                Text("Здесь пока пусто\n🤓")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }
            
            Button {
                vm.resetUserDefaults2()
                vm.generator.selectionChanged()
            } label: {
                Text("Перенести все глаголы в архив")
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.accentColor)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 2)
                    }
                    .shadow(color: .accentColor, radius: 5, x: 0, y: 2)
                
            }
            .padding()
        }
        .onDisappear {
            UserDefaults.standard.set(vm.anotherDictionary, forKey: "anotherDictionary")
            UserDefaults.standard.set(vm.dictionaryHome, forKey: "dictionaryHome")
        }
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct DictionaryPlusView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryPlusView()
            .environmentObject(ContainerVM())
    }
}
