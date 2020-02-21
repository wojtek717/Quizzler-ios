//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Wojciech Konury on 21/02/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    var questionNumber : Int = 0
    
    let quiz = [Question(questionText: "Two plus four is equal to Six", answer: true), Question(questionText: "2+3=7?", answer: false), Question(questionText: "Odpowiedz to false", answer: false)]
    
    func checkAnswer(userAnswer: Bool) -> Bool {
        return (userAnswer == quiz[questionNumber].answer)
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].questionText
    }
    
    func getProgress() -> Float {
        return Float(questionNumber)/Float(quiz.count)
    }
    
    mutating func nextQuestion() -> Bool {
        if (quiz.count - 1 > questionNumber) {
            questionNumber += 1
            return true
        }else{
            return false
        }
    }
}
