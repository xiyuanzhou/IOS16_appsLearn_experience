//
//  ContentView.swift
//  AnimateEverything
//
//  Created by Lucas on 1/31/23.
//

import SwiftUI

struct ContentView: View {
    @State var textValue = Text("Animate it")
    @State var textoffset: CGSize = CGSize(width: 0, height: 100)
    @State var textColor: Color = .red
    @State var textFont: Font = .largeTitle
    @State var textRoate: Double = 0
    @State var bgColor: Color = .blue
    @State var togglePos: Bool = false
    
    var body: some View {
        ZStack {
            bgColor
                .opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                
                textValue
                    .offset(textoffset)
                    .foregroundColor(textColor)
                    .font(textFont)
                    .rotationEffect(Angle(degrees: textRoate))
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1)) {
                        textoffset.height = togglePos ? 400 : 100
                        textColor = togglePos ? .purple : .red
                        textFont = togglePos ? .headline : .largeTitle
                        textRoate = togglePos ? 360 : 0
                        bgColor = togglePos ? .red.opacity(0.4) : .blue.opacity(0.4)
                        textValue = togglePos ? Text("Здравей, свят") : Text("Animate it")
                        
                        togglePos.toggle()
                    }
                    
                }, label: {
                    Text("Animate")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding()
                        .overlay(
                            Capsule().stroke()
                        )
                    
                })
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
