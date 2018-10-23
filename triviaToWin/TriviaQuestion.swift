//
//  TriviaQuestion.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/19/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

class TriviaQuestion {

    var question: String
    var answerArray: [String]
    let correctAnswerIndex: Int
    var correctAnswer: String {
        return  answerArray[correctAnswerIndex]
    }
    init(question: String, answerArray: [String], correctAnswerIndex: Int) {
        self.question = question
        self.correctAnswerIndex = correctAnswerIndex
        self.answerArray = answerArray
    }

}
