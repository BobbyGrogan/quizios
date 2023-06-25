//
//  timerBar.swift
//  trivia
//
//  Created by Bobby on 6/24/23.
//

import SwiftUI

struct timerBar: View {
    @State private var timerValue: CGFloat = 1.0
    @State private var isTimerRunning = false
    
    private let timerDuration: TimeInterval = 10.0
    
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
        timerBar()
            .padding()
    }
}
