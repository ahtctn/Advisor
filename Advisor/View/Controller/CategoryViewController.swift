//
//  CategoryViewController.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 28.08.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    var questions: [Question] = []
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        let currentQuestion = questions[currentQuestionIndex]
        
        questionLabel.text = currentQuestion.question
        answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
        answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
        answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
    }
    
}
