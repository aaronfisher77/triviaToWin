//
//  AddQuestionVC.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/19/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class AddQuestionVC: UIViewController {
    
    // Connects buttons to the objects on the front end of the View Controller
    @IBOutlet weak var newQuestion: UITextField!
    @IBOutlet weak var newAnswerA: UITextField!
    @IBOutlet weak var newAnswerB: UITextField!
    @IBOutlet weak var newAnswerC: UITextField!
    @IBOutlet weak var newAnswerD: UITextField!
    @IBOutlet weak var correctAnswerSelection: UISegmentedControl!
    
    
    // Sets necessary variables
    var newTrivia: TriviaQuestion?
    var questions = [TriviaQuestion]()
    
    // Necessary Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
    }
    
    
    //Function that allows you to Add a questions to your triviaQuestionsArray
    @IBAction func addButton(_ sender: Any) {
        guard // makes sure the variables have values
            let question = newQuestion.text, !question.isEmpty, // sets questions to newQuestions
            let a = newAnswerA.text, !a.isEmpty, // sets a to newAnswerA
            let b = newAnswerB.text, !b.isEmpty, // sets b to newAnswerB
            let c = newAnswerC.text, !c.isEmpty, // sets c to newAnswerC
            let d = newAnswerD.text, !d.isEmpty // sets d to newAnswerD
            else{
                // Pops up an error message that makes sure you have everything filled in
                let errorAlert = UIAlertController(title: "Wait!", message: "Please ensure that all fields are filled or press back to return to the main screen", preferredStyle: UIAlertController.Style.alert)
                // Allows you to dismiss the alert when you are
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {UIAlertAction in})
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil) // This makes for a cleaner transition when the error pops up
                return
        }
        newTrivia = TriviaQuestion(question: question, answerArray: [a,b,c,d], correctAnswerIndex: correctAnswerSelection.selectedSegmentIndex) // This will set the inputed texts into an actual spot creating an instance
        self.performSegue(withIdentifier: "showQuiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Prepares the new question to be sent over in the the question array in the quiz view controller.
        guard
            let destinationVC = segue.destination as? ViewController,
            let newTriviaQuestion = newTrivia // sets new trivia question
            else { return }
        destinationVC.TriviaQuestionsArray.append(newTriviaQuestion) // Adds new trivia question to array
    }
    
    
    @IBAction func BackButton(_ sender: Any) { // Allows user to unwind to the previous screen
        self.performSegue(withIdentifier: "unwindToTitleScreen", sender: self)
    }
    
    
    
}

