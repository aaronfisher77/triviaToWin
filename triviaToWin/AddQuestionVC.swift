//
//  AddQuestionVC.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/19/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class AddQuestionVC: UIViewController {

    var questions = [TriviaQuestion]()
    @IBOutlet weak var newQuestion: UITextField!
    @IBOutlet weak var newAnswerA: UITextField!
    @IBOutlet weak var newAnswerB: UITextField!
    @IBOutlet weak var newAnswerC: UITextField!
    @IBOutlet weak var newAnswerD: UITextField!
    @IBOutlet weak var correctAnswerSelection: UISegmentedControl!
    var newTrivia: TriviaQuestion?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        guard
            let question = newQuestion.text, !question.isEmpty,
            let a = newAnswerA.text, !a.isEmpty,
            let b = newAnswerB.text, !b.isEmpty,
            let c = newAnswerC.text, !c.isEmpty,
            let d = newAnswerD.text, !d.isEmpty
        else{
            let errorAlert = UIAlertController(title: "Error", message: "Please ensure that all fields are filled or press back to return to the main screen", preferredStyle: UIAlertController.Style.alert)
                
            let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {UIAlertAction in})
                errorAlert.addAction(dismissAction)
            self.present(errorAlert, animated: true, completion: nil)
            return
        }
        newTrivia = TriviaQuestion(question: question, answerArray: [a,b,c,d], correctAnswerIndex: correctAnswerSelection.selectedSegmentIndex)
        self.performSegue(withIdentifier: "unwindToTitleScreen", sender: self)
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToTitleScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destinationVC = segue.destination as? ViewController,
        let newTriviaQuestion = newTrivia
        else {return}
        destinationVC.TriviaQuestionsArray.append(newTriviaQuestion)
        destinationVC.resetGame()

    }
    
    
    
    
    
}

