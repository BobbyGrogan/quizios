//
//  qandaContainer.swift
//  trivia
//
//  Created by Bobby on 6/25/23.
//
import SwiftUI

struct ansButton: View {
    let answer: String
    let correct: Bool
    let isAnswered: Bool // Added isAnswered property to check if any answer has been selected
    
    var body: some View {
        let backColor: Color = isAnswered ? (correct ? .green : .red) : Color("answerColor")
        let textColor: Color = isAnswered ? .white : Color("textColor1")
        
        Button(action: {}) {
            Text(answer)
                .frame(width: 300)
                .padding()
                .background(backColor)
                .foregroundColor(textColor)
                .cornerRadius(8)
        }
      //  .disabled(isAnswered) // Disable button after any answer has been selected
    }
}

struct ansButton_Previews: PreviewProvider {
    static var previews: some View {
        ansButton(answer: "Hello, World!", correct: true, isAnswered: false)
    }
}


struct questionBlock: View {
    var question: String

    var body: some View {
        Text(question)
    }
}

struct questionBlock_Previews: PreviewProvider {
    static var previews: some View {
        questionBlock(question: "What is the capital of the United Kingdom?")
    }
}


struct timerBar: View {
    @State private var timerValue: CGFloat = 1.0
    @State private var isTimerRunning = false
    
    let timerDuration: TimeInterval
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: 20)
                .foregroundColor(.red)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * timerValue, height: 20)
                .foregroundColor(.green)
        }
        .cornerRadius(10)
        .onAppear {
            startTimer()
        }
    }
    
    private func startTimer() {
        guard !isTimerRunning else { return }
        
        isTimerRunning = true
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation(.linear(duration: timerDuration)) {
                timerValue = 0.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + timerDuration) {
                timer.invalidate()
                isTimerRunning = false
            }
        }
    }
}

struct timerBar_Previews: PreviewProvider {
    static var previews: some View {
        timerBar(timerDuration: 10)
            .padding()
    }
}

struct qandaContainer: View {
    let question: String
    let answers: [String]
    let correctAnswer: Int

    @State private var selectedAnswer: Int?
    @State private var isAnswered: Bool = false
    @State private var isQuestionDone: Bool = false // Track if the question is done
    
    var body: some View {
        VStack {
            timerBar(timerDuration: 19)
            
            questionBlock(question: isQuestionDone ? "Done" : question) // Update the question text
            
            ForEach(answers.indices, id: \.self) { index in
                ansButton(answer: answers[index], correct: correctAnswer == index, isAnswered: isAnswered)
                    .foregroundColor(answerColor(index: index))
                    .onTapGesture {
                        if !isAnswered {
                            selectedAnswer = index
                            isAnswered = true
                            isQuestionDone = true // Set the question as done
                        }
                    }
                    .disabled(isAnswered) // Disable button after any answer has been selected
            }
        }
        .padding()
    }

    private func answerColor(index: Int) -> Color {
        if let selectedAnswer = selectedAnswer {
            if correctAnswer == selectedAnswer && isAnswered {
                return .green
            } else if selectedAnswer == index && isAnswered {
                return .red // Set the selected incorrect answer to red
            }
        }
        return Color("answerColor")
    }
}
