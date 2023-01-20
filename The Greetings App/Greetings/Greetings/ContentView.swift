//
//  ContentView.swift
//  Greetings
//
//  Created by Lucas on 1/14/23.
//

import SwiftUI

struct DataItemModel: Identifiable {
    let id = UUID()
    
    let text: String
    let color: Color
    
}

struct ContentView: View {
    @State var tf: Bool = false
    
    var body: some View {
        ZStack {
            
            BackgroundBodyView()
                .preferredColorScheme(tf ? .dark: nil)
            VStack(alignment: .center) {
                
                TitleView()
                Spacer()
                //using (ForEach) method to simplify the code
                MessageViews()
                
                //another way to write (ForEach)
//                ForEach(0..<messages.count, content:{
//                    index in TextView(text: messages[index].text, color: messages[index].color)
//                })

                //TextView(text: messages[0].text, color: messages[0].color)

                Spacer()
                Text("Dark Mode")
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(15)
                    .onTapGesture{
                        tf.toggle()
                    }
            }
        }
    }
}

struct TitleView: View {
    @State var isRotated: Bool = false
    
    @State var captionIndex: Int = 0
    
    let captions: [String] = [
        "This is the greeting App! IOS 16",
        "Hello World",
        "You are good!",
        "have fun with the Apps",
        "Happy programming"
    ]

    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 6.0) {
                Text("Greeting").font(.largeTitle)
                    .fontWeight(.bold)
                Text(captions[captionIndex])
                    .font(.body)
                    .fontWeight(.thin)
            }.padding()
                .onTapGesture{
                    captionIndex = Int.random(in: 0..<captions.count)
                }
            
            Spacer()
            
            Circle()
                .strokeBorder(AngularGradient(gradient: Gradient(colors:[.blue,.red,.green]), center: .center, angle: .zero),
                              lineWidth:15)
                .rotationEffect(isRotated ? .zero : .degrees(360))
                .frame(maxWidth: 70, maxHeight: 70)
                .onTapGesture {
                    withAnimation(){
                        isRotated.toggle()
                    }
                }
                .padding()
            
            
        }
    }
}

struct TextView: View {
    let text: String
    @State var color: Color
    
    let colors: [Color] = [
        .pink,
        .black,
        .yellow,
        .blue,
        .red,
        Color(red: 0.4, green: 0.5, blue: 0.7)
    
    ]

    var body: some View {
        Text(text)
            .font(.title)
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .background(color.opacity(0.4))
            .cornerRadius(10.0)
            .shadow(color: color, radius: 5,x: 7, y: 7)
            .onTapGesture{
                let length = colors.count
                let randomIndex = Int.random(in: 0..<length)
                color = colors[randomIndex]
            }
            .padding(0.5)
    }
}

struct MessageViews: View {
    let messages = [
        DataItemModel(text: "Hello there!", color: .red),
        DataItemModel(text: "Welcome to Swift programming", color: .black),
        DataItemModel(text: "Are you Ready?", color: .blue),
        DataItemModel(text: "Start Exploring?", color: .green),
        DataItemModel(text: "BOOM!!", color: .pink)
    ]
    
    var body: some View {
        ForEach(messages, content: { dataItem in
            TextView(text: dataItem.text, color: dataItem.color)
        })
    }
}

struct BackgroundBodyView: View {
    var body: some View {
        
        let colors = [
            .red,
            .yellow,
            .blue,
            .yellow,
            .black,
            .red,
            .blue,
            Color(red: 139/255,
                  green: 80/255,
                  blue: 240/255)
        ]
        
        LinearGradient(colors: colors,
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .opacity(0.4).ignoresSafeArea()
        
//        LinearGradient(colors: [.red,
//                                .yellow,
//                                .blue,
//                                .yellow,
//                                .black,
//                                .red,
//                                Color(red: 139/255,
//                                      green: 80/255,
//                                      blue: 240/255
//                                     )],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//            .opacity(0.4).ignoresSafeArea()
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //ContentView()
            
            //.preferredColorScheme(.dark)
    }
}

