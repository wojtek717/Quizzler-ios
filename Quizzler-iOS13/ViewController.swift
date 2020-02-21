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
    
    var timer = Timer()
    var timeLeft = 2
    
    let quiz = [Question(questionText: "Two plus four is equal to Six", answer: true), Question(questionText: "2+3=7?", answer: false), Question(questionText: "Odpowiedz to false", answer: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quiz[0].questionText
        progressBar.progress = 0.0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        timeLeft = 2
        
        getUserAnswer(answer: sender.currentTitle!)
        
        if(quiz[questionNumber].answer == userAnswer){
            trueButton.backgroundColor = UIColor.green
        }else{
            falseButton.backgroundColor = UIColor.red
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
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        questionNumber += 1
        questionLabel.text = quiz[questionNumber].questionText
        progressBar.progress = Float(questionNumber)/Float(quiz.count)
    }
    
    @objc func updateTimer(){
            trueButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor = UIColor.clear
    }


}

