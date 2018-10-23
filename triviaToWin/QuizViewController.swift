//
//  ViewController.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/18/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func BackButton(_ sender: Any) {
         self.performSegue(withIdentifier: "unwindToTitleScreen", sender: self)
    }
    
    @IBAction func resetButton(_ sender: Any) {
    }
    
    var TriviaQuestionsArray: [TriviaQuestion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startQuestions()
    }
    

    
    
    
    func startQuestions() {
        let question1 = TriviaQuestion(question: "How many books are in the bible?", answerArray: ["7","77","66","1"], correctAnswerIndex: 2) // creates an instance of the first question
        let question2 = TriviaQuestion(question: "Who was swallowed by a whale at sthe end of the old testiment?", answerArray: ["Moses","Judas","David","Jonah"], correctAnswerIndex: 3) // creates an instance of the second question
        let question3 = TriviaQuestion(question: "Who betrayed Jesus in the story of The Last Supper?", answerArray: ["Judas","Jonah","Johnathan","Jimmy"], correctAnswerIndex: 0) // creates an instance of the third question
        let question4 = TriviaQuestion(question: "What is it called when Jesus is reffered to as The Father, The Son, and The Holy Spirit?", answerArray: ["3 Musketeers","Tri-Gods" ,"Trinity" ,"Three Amigos"], correctAnswerIndex: 2) // creates an instance of the fourth question
        let question5 = TriviaQuestion(question: "Which of the following is not a book of the bible?", answerArray: ["Habakkuk","David","Ruth","Nahum"], correctAnswerIndex: 1) // creates an instance of the fith question
        TriviaQuestionsArray.append(question1)
        TriviaQuestionsArray.append(question2)
        TriviaQuestionsArray.append(question3)
        TriviaQuestionsArray.append(question4)
        TriviaQuestionsArray.append(question5)
        
    }
    
        
    @IBAction func BackToTitleScreen(_ sender: Any) {
        performSegue(withIdentifier: "BackToTitleScreen", sender: self)
    }

    func resetGame(){
        // add function to reset game
    }
    
}


//003e6d
// 0 62 109

// 36daf3

//85caff
