import UIKit

protocol QuestionViewControllerPresenter: NSObject {
  func updateQuestionText(with value: String)
  func updateProgressBar(with value: Float)
  func displayAnswer(with value: Bool, for button: UIButton)
  func clearAnswer()
}

class QuestionViewCotroller: UIViewController {
  
  @IBOutlet private weak var questionLabel: UILabel!
  @IBOutlet private weak var progressBar: UIProgressView!
  @IBOutlet private weak var trueButton: UIButton!
  @IBOutlet private weak var falseButton: UIButton!
  
  lazy var viewModel = QuestionViewModel(presenter: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.updateQuestionText(with: viewModel.getQuestionNumber())
    viewModel.updateProgressBar()
  }
  
  @IBAction private func answerButtonPressed(_ sender: UIButton) {
    viewModel.checkAnswer(for: sender.currentTitle!, forButton: sender)
    viewModel.clearAnswerTime()
    viewModel.updateQuestionNumber()
    viewModel.updateQuestionText(with: viewModel.getQuestionNumber())
  }
}

extension QuestionViewCotroller: QuestionViewControllerPresenter{
  func updateQuestionText(with value: String){
    questionLabel.text = value
  }
  
  func updateProgressBar(with value: Float){
    progressBar.progress = value
  }
  
  func displayAnswer(with value: Bool, for button: UIButton){
    if value {
      button.backgroundColor = UIColor.green
    }else{
      button.backgroundColor = UIColor.red
    }
  }
  
  func clearAnswer() {
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
  }
}

