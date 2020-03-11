//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Wojciech Konury on 21/02/2020.
//

import Foundation

class Question{
  let questionText : String
  let answer : Bool
  
  public init(questionText: String, answer: Bool) {
    self.questionText = questionText
    self.answer = answer
  }
}
