//
//  ContentView.swift
//  Greetings
//
//  Created by Lucas on 1/14/23.
//

import SwiftUI

struct DataItemModel {
    let text: String
    let color: Color
    
}

struct ContentView: View {
    
    let messages = [
        DataItemModel(text: "Hello there", color: .red),
        DataItemModel(text: "Hello there", color: .blue),
        DataItemModel(text: "Hello there", color: .black),
        DataItemModel(text: "Hello there", color: .green),
        DataItemModel(text: "Hello there", color: .pink)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TextView(text: messages[0].text, color: messages[0].color)
            
            TextView(text: messages[1].text, color: messages[1].color)

            TextView(text: "Hello there!", color: .green)
            
            TextView(text: "Welcome to the program!", color: .black)
            
            TextView(text: "Hello world!", color: .purple)
            

            
            //changing the text color or size ...
            Text("This is first program")
                .font(.title2)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .background(Color.pink.opacity(0.8))
                .cornerRadius(5.0)
                .shadow(color: Color.pink, radius: 5,x: 5, y: 5)
                .padding(0.5)
            
            Text("Are you ready?")
                .font(.title2)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .background(Color.green.opacity(0.4))
                .cornerRadius(5.0)
                .shadow(color: Color.green, radius: 5,x: 5, y: 5)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.title)
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .background(color.opacity(0.4))
            .cornerRadius(5.0)
            .shadow(color: color, radius: 5,x: 5, y: 5)
        
            .padding(0.5)
    }
}
