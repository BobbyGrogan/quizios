//
//  qandaContainer.swift
//  trivia
//
//  Created by Bobby on 6/25/23.
//

import SwiftUI

struct qandaContainer: View {
    let question: String
    let answers: [String]
    let correctAnswer: Int

    @State private var selectedAnswer: Int?

    var body: some View {
        VStack {
            questionBlock(question: question)

            ForEach(0..<answers.count) { index in
                ansButton(answer: answers[index], correct: correctAnswer == index)
                    .foregroundColor(answerColor(index: index))
                    .onTapGesture {
                        selectedAnswer = index
                    }
            }
        }
    }

    private func answerColor(index: Int) -> Color {
        if let selectedAnswer = selectedAnswer {
            if index == selectedAnswer && index == correctAnswer {
                return .green
            } else if index == selectedAnswer && index != correctAnswer {
                return .red
            }
        }
        return Color("answerColor")
    }
}

struct qandaContainer_Previews: PreviewProvider {
    static var previews: some View {
        qandaContainer(question: "What is the capital of the United Kingdom?", answers: ["London", "Paris", "Berlin", "Madrid"], correctAnswer: 1)
    }
}
