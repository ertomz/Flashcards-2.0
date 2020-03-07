//
//  ViewController.swift
//  Flashcards
//
//  Created by Emily on 2/8/20.
//  Copyright © 2020 Emily Tomz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card.layer.cornerRadius = 20.0 // round edges
        card.layer.shadowRadius = 15.0 // add shadows
        card.layer.shadowOpacity = 0.2
        
        frontLabel.layer.cornerRadius = 20.0
        frontLabel.layer.shadowRadius = 15.0
        frontLabel.layer.shadowOpacity = 0.2
        
        backLabel.layer.cornerRadius = 20.0
        backLabel.layer.shadowRadius = 15.0
        backLabel.layer.shadowOpacity = 0.2
    
        // clips labels so the modifications show up
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        btnOptionOne.layer.cornerRadius = 20.0
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        btnOptionTwo.layer.cornerRadius = 20.0
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        btnOptionThree.layer.cornerRadius = 20.0
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        btnOptionOne.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    // If taps the question, nothing happens
    // If taps the answer, goes back to the question
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if frontLabel.isHidden == true {
            frontLabel.isHidden = false
            btnOptionOne.isHidden = false
            btnOptionTwo.isHidden = false
            btnOptionThree.isHidden = false
        } else {
            frontLabel.isHidden = true
        }
    }
   
    // If taps Button 1, hides the button
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    
    // If taps Button 2, hides all the buttons and reveals the correct answer!
    @IBAction func didTapOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true
        btnOptionOne.isHidden = true
        btnOptionTwo.isHidden = true
        btnOptionThree.isHidden = true
    }
    
    // If taps Button 3, hides the button
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
    }
    
    
    func updateFlashcard(question: String, answer: String, buttonOne: String, buttonTwo: String, buttonThree: String){
       
        // updates question and answer labels
        frontLabel.text = question
        backLabel.text = answer
        
        // updates buttons
        btnOptionOne.setTitle(buttonOne, for: UIControl.State.normal)
        btnOptionTwo.setTitle(buttonTwo, for: UIControl.State.normal)
        btnOptionThree.setTitle(buttonThree, for: UIControl.State.normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
    
}

