//
//  ViewController.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/18/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var QuestionDisplay: UILabel!
    @IBOutlet weak var AnswerADisplay: UIButton!
    @IBOutlet weak var AnswerBDisplay: UIButton!
    @IBOutlet weak var AnswerCDisplay: UIButton!
    @IBOutlet weak var AnswerDDisplay: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score) Points"
        }
    }

    let backroundColors = [ // Creates different backround colors
        UIColor(red: 177/255, green:183/255, blue: 188/255, alpha: 1.0),
        UIColor(red: 150/255, green:158/255, blue:164/255, alpha: 1.0),
        UIColor(red: 123/255, green:133/255, blue:140/255, alpha: 1.0),
        UIColor(red: 91/255, green:103/255, blue:112/255, alpha: 1.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startQuestions()
        getNewQuestion()
        setnewColor()
        TitleScreenViewController.quizPlayed += 1
    }
    
    var currentIndex: Int! // Allows for the variable currentIndex
    var questionsPlaceHolder: [TriviaQuestion] = [] // sets a place holder for the questions when they have been answered
    
    @IBAction func AnswerTapped(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag == currentQuestion.correctAnswerIndex { // checks to see if the answer is correct
           showCorrectAnswerAlert() // shows correct screen
            score += 1 // adds to points
        }else{
           showIncorrectAnswerAlert() // shows incorrect screen if answer is wrong
        }
    }
    
    func showCorrectAnswerAlert () {
        
        let correctAnswerArray = ["Nice! You are correct!", "Wow, your pretty smart!", "How high is your IQ?", "Man on a scale of 1-10, you did great!", "That would be correct!"] // This in an array of Phases that tell the user they are correct
        let correctrandomnumber = Int.random(in: 0..<correctAnswerArray.count) // Sets a random number
        
        let correctAlert = UIAlertController(title: "Correct", message: correctAnswerArray[correctrandomnumber], preferredStyle: UIAlertController.Style.actionSheet) //Creates an alert witht the title of Correct then prints one of the randomly selected phrase in the Array
        
        let okAction = UIAlertAction(title: "Thank You", style: UIAlertAction.Style.default) {UIAlertAction in // Creates a user interactable button to dismiss the alert
        self.questionsPlaceHolder.append(self.TriviaQuestionsArray[self.currentIndex]) //Adds the question to the place holder array
        self.TriviaQuestionsArray.remove(at: self.currentIndex)// Takes question out of the questionTriviaArray
        self.getNewQuestion()// prepares the new question
        }
        
        correctAlert.addAction(okAction)
        self.present(correctAlert, animated: true, completion: nil) // makes a smoother transition when the alert pops up
    }
    
    
    func showIncorrectAnswerAlert () {
        
        let incorrectAnswerArray = ["Nope, thats incorrect.", "*beep*I'm sorry, the answer you have chose is incorrect*beep*", "On a scale of 1-10 that was very incorrect.", "Awe... so close... kind of..."] // This in an array of Phases that tell the user they are incorrect
        let incorrectrandomnumber = Int.random(in: 0..<incorrectAnswerArray.count)
        
        let incorrectAlert = UIAlertController(title: "Wrong", message: incorrectAnswerArray[incorrectrandomnumber], preferredStyle: UIAlertController.Style.actionSheet)//Creates an alert witht the title of "Wrong" then prints one of the randomly selected phrase in the Array
        
        let okAction = UIAlertAction(title: "Thank You", style: UIAlertAction.Style.default) {UIAlertAction in // Creates a user interactable button to dismiss the alert
            self.questionsPlaceHolder.append(self.TriviaQuestionsArray[self.currentIndex])//Adds the question to the place holder array
            self.TriviaQuestionsArray.remove(at: self.currentIndex)// Takes question out of the questionTriviaArray
            self.getNewQuestion()// prepares the new question
        }
        
        incorrectAlert.addAction(okAction)
        self.present(incorrectAlert, animated: true, completion: nil)// makes a smoother transition when the alert pops up
    }
    
    
    func showGameOverAlert() {
        
        let endAlert = UIAlertController(title: "Game Over", message: "Your final score was \(score)", preferredStyle: UIAlertController.Style.alert) // Creates alert
        let resetAction = UIAlertAction(title: "Reset", style: UIAlertAction.Style.default) {UIAlertAction in
            self.resetGame() // Resets the game
        }
        endAlert.addAction(resetAction)
        self.present(endAlert, animated: true, completion: nil)// Makes a smoother transition when the alert pops up
    }
    
    
    
    var currentQuestion: TriviaQuestion! {
        didSet {
            if let currentQuestion = currentQuestion {
                QuestionDisplay.text = currentQuestion.question // Show the new text visually after the code is changed
                AnswerADisplay.setTitle(currentQuestion.answerArray[0], for: .normal)// Show the new text visually after the code is changed
                AnswerBDisplay.setTitle(currentQuestion.answerArray[1], for: .normal)// Show the new text visually after the code is changed
                AnswerCDisplay.setTitle(currentQuestion.answerArray[2], for: .normal)// Show the new text visually after the code is changed
                AnswerDDisplay.setTitle(currentQuestion.answerArray[3], for: .normal)// Show the new text visually after the code is changed
                setnewColor() // Sets different colors
            }
        }
    }

    func getNewQuestion(){
        if TriviaQuestionsArray.count > 0 {
            currentIndex = Int.random(in: 0..<TriviaQuestionsArray.count) // picks a random question from the Array
            currentQuestion = TriviaQuestionsArray[currentIndex]
        }else{
            showGameOverAlert() // ends game when thereis no more questions left
        }
}
    
    var TriviaQuestionsArray: [TriviaQuestion] = [] // creates the array of original questions
    
    @IBAction func resetButton(_ sender: Any) { // Resets the game
        resetGame()
    }
    
    
    func startQuestions() {
        let question1 = TriviaQuestion(question: "How many books are in the bible?", answerArray: ["7","77","66","1"], correctAnswerIndex: 2) // creates an instance of the first question
        let question2 = TriviaQuestion(question: "Who was swallowed by a whale at sthe end of the old testiment?", answerArray: ["Moses","Judas","David","Jonah"], correctAnswerIndex: 3) // creates an instance of the second question
        let question3 = TriviaQuestion(question: "Who betrayed Jesus in the story of The Last Supper?", answerArray: ["Judas","Jonah","Johnathan","Jimmy"], correctAnswerIndex: 0) // creates an instance of the third question
        let question4 = TriviaQuestion(question: "What is it called when Jesus is reffered to as The Father, The Son, and The Holy Spirit?", answerArray: ["3 Musketeers","Tri-Gods" ,"Trinity" ,"Three Amigos"], correctAnswerIndex: 2) // creates an instance of the fourth question
        let question5 = TriviaQuestion(question: "Which of the following is not a book of the bible?", answerArray: ["Habakkuk","David","Ruth","Nahum"], correctAnswerIndex: 1) // creates an instance of the fith question
        
        // Adds the questions to the Array
        TriviaQuestionsArray.append(question1)
        TriviaQuestionsArray.append(question2)
        TriviaQuestionsArray.append(question3)
        TriviaQuestionsArray.append(question4)
        TriviaQuestionsArray.append(question5)
        
    }
    
    func setnewColor() { // Sets a random number ti each color that are not the same number
        let randomNumber = Int.random(in: 1...100)
        let randomColorA = backroundColors[randomNumber % 4]
        let randomColorB = backroundColors[(randomNumber + 2 ) % 4]
        let randomColorC = backroundColors[(randomNumber + 3 ) % 4]
        let randomColorD = backroundColors[(randomNumber + 1 ) % 4]
        
        // Sets the random color to the answer options
        AnswerADisplay.backgroundColor = randomColorA
        AnswerBDisplay.backgroundColor = randomColorB
        AnswerCDisplay.backgroundColor = randomColorC
        AnswerDDisplay.backgroundColor = randomColorD
    }
    
    func resetGame() {
        //need to call this everytime a new question is added and everytime the reset button is pushed
        score = 0 // resets score to 0
        if !TriviaQuestionsArray.isEmpty { // sets trivia question to all one array
            questionsPlaceHolder.append(contentsOf: TriviaQuestionsArray)
        }
        TriviaQuestionsArray = questionsPlaceHolder
        questionsPlaceHolder.removeAll() // removes all trivia question from the original screen
        getNewQuestion()
    }
}

