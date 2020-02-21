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
    
    var userAnswer : Bool = false
    
    var timer = Timer()
    var timeLeft = 2
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        timeLeft = 2
        
        getUserAnswer(answer: sender.currentTitle!)
        
        if quizBrain.checkAnswer(userAnswer: userAnswer) {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
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
        quizBrain.nextQuestion()
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
    }
    
    @objc func updateTimer(){
            trueButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor = UIColor.clear
    }


}

