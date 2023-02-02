//
//  ContentView.swift
//  NavExample
//
//  Created by Lucas on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var code: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
//                Text("Navigation Example")
//                    .font(.largeTitle)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Enter your name")
                    TextField("Lucas Zhou", text: $name)
                        .keyboardType(.default)
                }
                
                VStack(alignment: .leading){
                    Text("Enter code")
                    TextField("passcode", text: $code)
                        .keyboardType(.numberPad)
                }
                
                Spacer()
                NavigationLink(destination: {
                    
                }, label: {
                    Text("Testing the Views")
                        .font(.title)
                        .padding()
                        .overlay(
                            Capsule()
                                .stroke()
                        )
                })
                
                NavigationLink(destination: {
                    ProcessView(name: name, age: code)
                }, label: {
                    Text("Enter")
                        .font(.title)
                        .padding()
                        .overlay(
                            Capsule()
                                .stroke()
                        )
                })
            }
            .padding()
            .navigationTitle("Nav Example")
        }
    }
}


struct ProcessView: View {
    let name: String
    let age: String
    
    var numericalAge: Int {
        Int(age) ?? -1
    }
    
    var body: some View {
        ZStack {
            Color
                .blue
                .opacity(0.3)
                .ignoresSafeArea()
            
            if numericalAge >= 18 {
                Text("Hi \(name), You can drink")
            }else if numericalAge < 0 {
                Text("\(age) Invalid age!")
            }else {
                Text("Sorry \(name), You cannot drink!!")
            }
                    
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
