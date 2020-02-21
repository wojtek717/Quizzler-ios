//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questionNumber = 0
    var userAnswer : Bool = false
    
    let quiz = [Question(questionText: "Two plus four is equal to Six", answer: true), Question(questionText: "2+3=7?", answer: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quiz[0].questionText
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        getUserAnswer(answer: sender.currentTitle!)
        
        if(quiz[questionNumber].answer == userAnswer){
            print("Right!")
        }else{
            print("False!")
        }
        
        updateUI()
    }
    
    func getUserAnswer(answer: String){
        if(answer == "True"){
            userAnswer = true
        }else{
            userAnswer = false
        }
    }
    
    func updateUI(){
        questionNumber += 1
        questionLabel.text = quiz[questionNumber].questionText
    }


}

