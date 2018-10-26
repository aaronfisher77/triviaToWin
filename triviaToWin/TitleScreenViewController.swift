//
//  TitleScreenViewController.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/19/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    static var quizPlayed = 0
    
    @IBAction func unwindToTitleScreen(segue: UIStoryboardSegue) { } // This allows for the unwinds to unwind back tho this screen

    @IBAction func addQuestionButton(_ sender: Any) {
        if TitleScreenViewController.quizPlayed == 0 {
            let errorAlert = UIAlertController(title: "Wait!", message: "Please play the original game before adding questions", preferredStyle: UIAlertController.Style.alert)
            // Allows you to dismiss the alert when you are
            let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {UIAlertAction in})
            errorAlert.addAction(dismissAction)
            self.present(errorAlert, animated: true, completion: nil) // This makes for a cleaner transition when the error pops up
            return
        }
        

    }
    
    


}
