//
//  ViewController.swift
//  Quizzler
//
//  Created by Slimn Srarena on 13/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelProgress: UILabel!
    @IBOutlet var progressBar: UIView!
    
    let allQuestion = QuestionsBank()
    var pickAnswer : Bool = false
    var questionIndex: Int = 0
    var currentScore: Int = 0
    var totalQuestion: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        totalQuestion = allQuestion.questionList.count
        updateUI()
    }

    @IBAction func anwserPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            pickAnswer = true
        }
        else {
            pickAnswer = false
        }
        checkAnswer()
        questionIndex += 1;
        updateUI()
    }
    
    func updateUI() {
        if questionIndex < totalQuestion {
            labelScore.text = "Score: \(currentScore)"
            labelProgress.text = "\(questionIndex+1)/\(totalQuestion)"
            
            progressBar.frame.size.width = (view.frame.size.width / CGFloat(totalQuestion)) * CGFloat(questionIndex + 1)
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        if questionIndex < totalQuestion {
            labelQuestion.text = allQuestion.questionList[questionIndex].questionText
        }
        else {
            let alert = UIAlertController(title: "Awsome",
                                          message: "You're have finished all the question, do you want to start over?",
                                          preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Start", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() {
        let answer = allQuestion.questionList[questionIndex].answer
        if pickAnswer == answer {
            ProgressHUD.showSuccess("Correct")
            currentScore += 1
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    func startOver() {
        questionIndex = 0
        currentScore = 0
        updateUI()
    }
}

