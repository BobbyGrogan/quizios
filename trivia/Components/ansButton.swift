//
//  qButton.swift
//  bruh
//
//  Created by Bobby Grogan on 6/18/23.
//
import SwiftUI

struct ansButton: View {
    let answer: String
    let backColor: Color = Color("answerColor")
    let textColor: Color = Color("textColor1")
    
    var body: some View {
        Text(answer)
            .frame(width: 300)
            .padding()
            .background(backColor)
            .foregroundColor(textColor)
            .cornerRadius(8)
    }
}

struct ansButton_Previews: PreviewProvider {
    static var previews: some View {
        ansButton(answer: "Hello, World!")
    }
}
