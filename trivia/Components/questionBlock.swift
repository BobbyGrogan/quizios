//
//  questionBlock.swift
//  trivia
//
//  Created by Bobby on 6/24/23.
//

import SwiftUI

struct questionBlock: View {
    let question: String
  //  let backColor: Color = Color("answerColor")
  //  let textColor: Color = Color("textColor1")

    var body: some View {
        Text(question)
    }
}

struct questionBlock_Previews: PreviewProvider {
    static var previews: some View {
        questionBlock(question: "What is the capital of the United Kingdom?")
    }
}
