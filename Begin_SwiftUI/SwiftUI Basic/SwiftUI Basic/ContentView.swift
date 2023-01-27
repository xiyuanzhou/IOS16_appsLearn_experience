
//  SwiftUI Basic

import SwiftUI

//HStack -> horizontal
//VStack -> vertical
//ZStack -> over lap everything
struct ContentView: View {
    
    var body: some View {
        ZStack {
            Testcase1()
            
            
        }
    }
}

struct ContentView2: View {
    var body: some View{
        ZStack {
            Testcase2()
        }
    }
}


struct ShowText: View {
    var body: some View {
        Text("SwiftUI Basic 1")
            .font(.largeTitle)
            .foregroundColor(.purple)
        Text("SwiftUI Basic 2")
            .font(.largeTitle)
            .foregroundColor(.green)
        Text("SwiftUI Basic 3")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct Testcase1: View {
    let textlist: [String] = [
        "SwiftUI Basic 1",
        "SwiftUI Basic 2",
        "SwiftUI Basic 3"
    ]
    
    let colorlist1: [Color] = [
        .purple, .red, .blue
    ]
    
    let colorlist2: [Color] = [
        .green, .red, .black
    ]
    
    @State private var bgchange: Bool = true
    
    @State private var wordsloc1: CGFloat = -500.0
    
    @State private var wordsloc2: CGFloat = 500.0
    
    var body: some View {
        LinearGradient(
            colors: bgchange ? colorlist1: colorlist2, startPoint: .bottomLeading,
            endPoint: .topLeading)
        .ignoresSafeArea()
        .opacity(0.4)
        .onTapGesture{
            bgchange.toggle()
            withAnimation(.easeIn(duration: 0.7)){
                if bgchange{
                    wordsloc1 = -500.0
                    wordsloc2 = 0
                }else{
                    wordsloc1 = 0
                    wordsloc2 = 500.0
                }
            }
        }
        
        VStack(spacing: -30) {
            
            ShowText()
                .offset(y: wordsloc1)
        }
        
        VStack(spacing: -30) {
            
            ShowText()
                .offset(y: wordsloc2)
            
        }
    }
}

struct Testcase2: View {
    let textlist: [String] = [
        "SwiftUI Basic 1",
        "SwiftUI Basic 2",
        "SwiftUI Basic 3"
    ]
    
    let colorlist1: [Color] = [
        .purple, .red, .blue
    ]
    
    let colorlist2: [Color] = [
        .green, .red, .black
    ]
    
    @State private var screenTap: Bool = true
    
    let rotationAngel: CGFloat = 360.0
    
    var body: some View {
        LinearGradient(
            colors: screenTap ? colorlist1: colorlist2, startPoint: .bottomLeading,
            endPoint: .topLeading)
        .ignoresSafeArea()
        .opacity(0.4)
        .onTapGesture{
            withAnimation{
                screenTap.toggle()
            }
        }
        
        Text(screenTap ? "The basic of swiftUI" : "Let's get what you know, the world is big!")
            .font(screenTap ? .largeTitle : .title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .rotation3DEffect(.degrees(screenTap ? 0 : rotationAngel), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
        ContentView()
    }
}
