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
            timerBar(timerDuration: 19)
            qandaContainer(question: "What is the capital of the United Kingdom?", answers: ["London", "Manchester", "Edinburgh", "Belfast"], correctAnswer: 2)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
