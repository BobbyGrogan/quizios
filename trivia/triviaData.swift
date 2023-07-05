//
//  triviaData.swift
//  trivia
//
//  Created by Bobby on 7/3/23.
//

import Foundation

struct TriviaData {
    let questionsAndAnswers: [(String, [[String: Bool]])] = [
        ("What is the capital of France?", [
            ["Madrid": false],
            ["London": false],
            ["Berlin": false],
            ["Paris": true]
        ]),
        ("Who wrote the novel 'Pride and Prejudice'?", [
            ["Hello": false],
            ["Emily Brontë": false],
            ["Jane Austen": true],
            ["Louisa May Alcott": false]
        ]),
        ("Which planet is known as the Red Planet?", [
            ["Mars": true],
            ["Venus": false],
            ["Mercury": false],
            ["Jupiter": false]
        ]),
        ("What is the chemical symbol for gold?", [
            ["Po": false],
            ["Ag": false],
            ["Au": true],
            ["Pt": false]
        ])
    ]
}

