//
//  qButton.swift
//  bruh
//
//  Created by Bobby Grogan on 6/18/23.
//import SwiftUI
import SwiftUI

struct ansButton: View {
    let answer: String
    let correct: Bool
    @State private var isClicked = false
    
    var body: some View {
        let backColor: Color = isClicked ? (correct ? .green : .red) : Color("answerColor")
        let textColor: Color = isClicked ? .white : Color("textColor1")
        
        Button(action: {
            isClicked = true
        }) {
            Text(answer)
                .frame(width: 300)
                .padding()
                .background(backColor)
                .foregroundColor(textColor)
                .cornerRadius(8)
        }
        .disabled(isClicked) // Disable button after it has been clicked
    }
}

struct ansButton_Previews: PreviewProvider {
    static var previews: some View {
        ansButton(answer: "Hello, World!", correct: true)
    }
}
