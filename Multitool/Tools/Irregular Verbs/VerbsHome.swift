import SwiftUI
import AVFoundation

struct VerbsHome: View {
    @EnvironmentObject private var vm: ContainerVM
    
    @State private var key = ""
    @State private var value = ""
    @State private var showValue = false
    @State private var showValue2 = false
    @State private var showValue3 = true
    @State private var usedKeys: Set<String> = []
    
    @State private var speed = 0.1
    @State private var isEditing = false
    
    private let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            GroupBox(label: Text("**Неправильные глаголы**").foregroundColor(.accentColor)) {
                Text(key)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                    .onAppear {
                        generateRandomPair()
                    }
                
                if showValue {
                    Text(value)
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .padding(.vertical)
                }
                
                HStack {
                    Button {
                        speak(showValue ? value : key)
                        vm.generator.selectionChanged()
                    } label: {
                        if !showValue2 {
                            Text("Озвучить 🔊")
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
                    }
                    .disabled(key.isEmpty)
                    
                    Button {
                        vm.generator.selectionChanged()
                        showValue.toggle()
                        if !showValue {
                            generateRandomPair()
                        }
                    } label: {
                        if !showValue2 {
                            Text(showValue ? "Следующий >" : "Неправильные")
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
                    }
                }
                
            }
            .padding()
            if !showValue3 {
                Button {
                    vm.generator.selectionChanged()
                    usedKeys.removeAll()
                    generateRandomPair()
                    if vm.dictionaryHome.count != 0 {
                        showValue2 = false
                        showValue3 = true
                    }
                } label: {
                    Text("Рестарт")
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
                        .padding()
                }
            }
            Slider(
                value: $speed,
                in: 0...0.5,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            .frame(width: 200)
            Text("Скорость озвуки")
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
    
    
    func generateRandomPair() {
        let availableKeys = vm.dictionaryHome.keys.filter { !usedKeys.contains($0) }
        
        if let randomKey = availableKeys.randomElement() {
            key = randomKey
            value = vm.dictionaryHome[randomKey]!
            usedKeys.insert(randomKey)
        } else {
            key = "Глаголы закончились, повторим?"
            value = ""
            showValue2 = true
            showValue3 = false
        }
    }
    
    func speak(_ text: String) {
        var utterance = AVSpeechUtterance()
        
        if let textToSpeak = text.split(separator: "(").first {
            utterance = AVSpeechUtterance(string: String(textToSpeak))
        } else {
            utterance = AVSpeechUtterance(string: text)
        }
        
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = Float(speed)
        synthesizer.speak(utterance)
    }
}

struct VerbsHome_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContainerVM())
    }
}
