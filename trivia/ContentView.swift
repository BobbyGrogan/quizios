//
//  ContentView.swift
//  trivia
//
//  Created by Bobby on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            timerBar()
            questionBlock(question: "What is the capital of the United Kingdom?")
            ansButton(answer: "London")
            ansButton(answer: "Manchester")
            ansButton(answer: "Edinburgh")
            ansButton(answer: "Belfast")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

