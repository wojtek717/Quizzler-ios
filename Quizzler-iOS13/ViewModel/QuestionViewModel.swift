//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Wojciech Konury on 21/02/2020.

import Foundation
import UIKit

class QuestionViewModel{
  
  private weak var presenter: QuestionViewControllerPresenter?
  var questionNumber : Int = 0
  var timer = Timer()
  
  let quiz = [Question(questionText: "Two plus four is equal to Six", answer: true), Question(questionText: "2+3=7?", answer: false), Question(questionText: "Odpowiedz to false", answer: false)]
  
  init(presenter: QuestionViewControllerPresenter?){
    self.presenter = presenter
  }
  
  func updateQuestionText(with value: Int) -> Void {
    let questionText = quiz[value].questionText
    presenter?.updateQuestionText(with: questionText)
  }
  
  func updateProgressBar() ->  Void {
    let progress = Float(questionNumber)/Float(quiz.count)
    presenter?.updateProgressBar(with: progress)
  }
  
  func getQuestionNumber() -> Int {
    return questionNumber
  }
  
  func updateQuestionNumber() -> Void{
    questionNumber += 1
  }
  
  func clearAnswerTime() -> Void{
    timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearAnswer), userInfo: nil, repeats: false)
  }
  
  @objc func clearAnswer() -> Void{
    presenter?.clearAnswer()
  }
  
  func checkAnswer(for answer: String, forButton button: UIButton) -> Void {
    var userAnswer: Bool?
    
    if(answer == "True"){
      userAnswer = true
    }else{
      userAnswer = false
    }
    
    let isCorrectAnswer = (userAnswer == quiz[questionNumber].answer)
    presenter?.displayAnswer(with: isCorrectAnswer, for: button)
  }
  
}
