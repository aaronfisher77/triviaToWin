//
//  RemoveQuestionViewController.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/23/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class RemoveQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToTitleScreen", sender: self)
    }

}
