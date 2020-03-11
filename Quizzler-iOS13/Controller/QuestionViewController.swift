import UIKit

//TODO NAPRAWIC WYSWIETLANIA PROGRESS BARA, OSTATNIE PYTANIE ITP.

protocol QuestionViewControllerPresenter: NSObject {
  func updateQuestionText(with value: String)
  func updateProgressBar(with value: Float)
  func displayAnswer(with value: Bool, for button: UIButton)
  func clearAnswer()
}



class QuestionViewCotroller: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
  
  lazy var viewModel = QuestionViewModel(presenter: self)
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      viewModel.updateQuestionText(with: viewModel.getQuestionNumber())
      viewModel.updateProgressBar()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
      viewModel.checkAnswer(for: sender.currentTitle!, forButton: sender)
      viewModel.clearAnswerTime()
      viewModel.updateQuestionNumber()
      viewModel.updateQuestionText(with: viewModel.getQuestionNumber())
      
      //print(viewModel.getQuestionNumber())
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

