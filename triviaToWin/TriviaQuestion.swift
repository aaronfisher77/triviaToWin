//
//  TriviaQuestion.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/19/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

class TriviaQuestion {

    // Sets variables for the TriviaQuestion class
    var question: String
    var answerArray: [String]
    let correctAnswerIndex: Int
    var correctAnswer: String {
        return  answerArray[correctAnswerIndex] // returns the answersArray's correct answer and sets it equal to correctAnswer
    }
    
    init(question: String, answerArray: [String], correctAnswerIndex: Int) { // Initializes the variable for the class
        self.question = question
        self.correctAnswerIndex = correctAnswerIndex
        self.answerArray = answerArray
    }

}
