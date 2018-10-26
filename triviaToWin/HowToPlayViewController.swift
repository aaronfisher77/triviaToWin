//
//  HowToPlayViewController.swift
//  triviaToWin
//
//  Created by Aaron Fisher on 10/19/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {// This files only purpose is to give the view controller a back button that is visually appealing

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackButton(_ sender: Any) { // Allows to unwind back to title screen without stacking screens
        self.performSegue(withIdentifier: "unwindToTitleScreen", sender: self)
    }

}
