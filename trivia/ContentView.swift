//  ContentView.swift
//  trivia
//
//  Created by Bobby on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    let triviaData = TriviaData()

    @State private var currentQuestionIndex = 0
    @State private var userScore = 0
    @State private var showScore = false
    @State private var timerValue = 10.0
    @State private var timer: Timer?
    
    @State private var selectedAnswerIndex: Int?

    var currentQuestion: (String, [[String: Bool]]) {
        triviaData.questionsAndAnswers[currentQuestionIndex]
    }

    var body: some View {
        NavigationView {
            if showScore {
                ScoreView(score: userScore, totalQuestions: triviaData.questionsAndAnswers.count)
                    .navigationBarTitle("Score")
                    .navigationBarItems(trailing: Button(action: {
                        restartQuiz()
                    }, label: {
                        Text("Try Again")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 60)
                            .background(Color.blue)
                            .cornerRadius(30)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                            .padding()
                            .offset(y: UIScreen.main.bounds.height / 2 - 30) // Adjust the offset as needed
                    }))
            } else {
                VStack(spacing: 20) {
                    VStack(spacing: 50) {
                        HStack {
                            Spacer()
                            Image(systemName: "line.3.horizontal")
                            Spacer()
                            Text("Title")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)

                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color(.purple).opacity(0.3))
                                .frame(height: 20)

                            Rectangle()
                                .foregroundColor(Color(.purple))
                                .frame(width: UIScreen.main.bounds.width - 20, height: 20)
                                .cornerRadius(10)
                                .animation(.linear(duration: 0.01))

                                .scaleEffect(x: CGFloat(timerValue) / 10, y: 1, anchor: .leading)
                                .onChange(of: timerValue) { newValue in
                                    if newValue <= 0 {
                                        handleTimeUp()
                                    }
                                }
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 20)
                    }

                    VStack(spacing: 10) {
                        Text(currentQuestion.0)
                            .bold()

                        ForEach(0..<currentQuestion.1.count, id: \.self) { index in
                            let answer = currentQuestion.1[index]

                            let answerText = answer.keys.first ?? ""
                            let isCorrect = answer[answerText] ?? false

                            Button {
                                if selectedAnswerIndex == nil {
                                    selectedAnswerIndex = index
                                    stopTimer()
                                    handleAnswerSelection()
                                }
                            } label: {
                                Text(answerText)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(buttonBackgroundColor(for: (index, isCorrect)))
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                            }
                            .disabled(selectedAnswerIndex != nil)
                            .opacity(selectedAnswerIndex == nil ? 1.0 : 0.5)
                        }
                    }
                    .padding()

                    ProgressView(value: Double(currentQuestionIndex + 1) / Double(triviaData.questionsAndAnswers.count))
                        .progressViewStyle(LinearProgressViewStyle())
                        .frame(height: 20)
                        .foregroundColor(Color(.orange))
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        .scaleEffect(x: 1, y: 4, anchor: .center)

                    Spacer()
                }
                .padding()
                .navigationBarHidden(showScore)
            }
        }
        .onAppear {
            userScore = 0
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }

    private func buttonBackgroundColor(for answerAndIndex: (Int, Bool)) -> Color {
        if let selectedAnswerIndex = selectedAnswerIndex {
            if selectedAnswerIndex == answerAndIndex.0 {
                if answerAndIndex.1 {
                    return .green
                } else {
                    return .red
                }
            }
        } else if timerValue <= 0 && answerAndIndex.1 {
            return .green
        }
        return .white
    }

    private func handleAnswerSelection() {
        if let selectedAnswerIndex = selectedAnswerIndex {
            let answer = currentQuestion.1[selectedAnswerIndex]
            let isCorrect = answer.values.first ?? false
            if isCorrect {
                userScore += 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if currentQuestionIndex < triviaData.questionsAndAnswers.count - 1 {
                    currentQuestionIndex += 1
                } else {
                    showScore = true
                }
                self.selectedAnswerIndex = nil
                startTimer()
            }
        }
    }
    
    private func handleTimeUp() {
        if selectedAnswerIndex == nil {
            if currentQuestionIndex < triviaData.questionsAndAnswers.count - 1 {
                let correctAnswerIndex = currentQuestion.1.firstIndex(where: { $0.values.first == true })
                if let correctAnswerIndex = correctAnswerIndex {
                    selectedAnswerIndex = correctAnswerIndex
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    currentQuestionIndex += 1
                    self.selectedAnswerIndex = nil
                    startTimer()
                }
            } else {
                let correctAnswerIndex = currentQuestion.1.firstIndex(where: { $0.values.first == true })
                if let correctAnswerIndex = correctAnswerIndex {
                    selectedAnswerIndex = correctAnswerIndex
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showScore = true
                }
            }
        }
    }

    private func startTimer() {
        timer?.invalidate()
        timerValue = 10.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if timerValue > 0 {
                timerValue -= 0.01
            } else {
                timer.invalidate()
                handleTimeUp()
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
    }

    private func restartQuiz() {
        currentQuestionIndex = 0
        selectedAnswerIndex = nil
        userScore = 0
        showScore = false
        timer?.invalidate()
        timer = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ScoreView: View {
    let score: Int
    let totalQuestions: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("Quiz Completed")
                .font(.title)
                .bold()

            Text("Your Score:")
                .font(.headline)

            Text("\(score) out of \(totalQuestions)")
                .font(.largeTitle)
                .bold()

            Spacer()
        }
        .padding()
    }
}
