//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Emily on 3/6/20.
//  Copyright © 2020 Emily Tomz. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    // Instantiates variables for the five text fields
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var btnOptionOneTextField: UITextField!
    @IBOutlet weak var btnOptionTwoTextField: UITextField!
    @IBOutlet weak var btnOptionThreeTextField: UITextField!
    
    var flashcardsController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: UIBarButtonItem) {
            
        // Get text in question text field
        let questionText = questionTextField.text
        
        // Get text in answer text field
        let answerText = answerTextField.text
        
        // Get text in button option text fields
        let btnOptionOneText = btnOptionOneTextField.text
        let btnOptionTwoText = btnOptionTwoTextField.text
        let btnOptionThreeText = btnOptionThreeTextField.text
        
        // Checks if all spaces are filled when creating a new flashcard
        if questionText == nil || questionText!.isEmpty || answerText == nil || answerText!.isEmpty || btnOptionOneText == nil || btnOptionOneText!.isEmpty || btnOptionTwoText == nil || btnOptionTwoText!.isEmpty || btnOptionThreeText == nil || btnOptionThreeText!.isEmpty {
            
            // Creates error
            let alert = UIAlertController(title: "Missing Text", message: "You need more information for your flashcard", preferredStyle: .alert)
                       
            // Presents error
            present(alert, animated: true)
            
            // Dismiss error
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
        
        } else {
       
           // Calls function to update flashcard
            flashcardsController.updateFlashcard(question:  questionText!, answer: answerText!, buttonOne: btnOptionOneText!, buttonTwo: btnOptionTwoText!, buttonThree: btnOptionThreeText!)
            
            // Dismiss
            dismiss(animated:true)
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
