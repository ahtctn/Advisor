//
//  CategoryPickerViewController.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 21.08.2023.
//

import UIKit

class CategoryPickerViewController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var bookButton: CategoryButton!
    @IBOutlet weak var movieButton: CategoryButton!
    @IBOutlet weak var musicButton: CategoryButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var categoryChoice: Constants.ButtonImages.ButtonType?
    
    // Define your categories here
    var categories: [Category] = [
        Category(questions: [
            Question(question: "Music Soru 1", answers: ["Cevap 1A", "Cevap 1B", "Cevap 1C"]),
            Question(question: "Music Soru 2", answers: ["Cevap 2A", "Cevap 2B", "Cevap 2C"]),
            Question(question: "Music Soru 3", answers: ["Cevap 3A", "Cevap 3B", "Cevap 3C"])
        ],
                 buttonType: .music),
        
        Category(questions: [
            Question(question: "Book Soru A", answers: ["Cevap AA", "Cevap AB", "Cevap AC"]),
            Question(question: "Book Soru B", answers: ["Cevap BA", "Cevap BB", "Cevap BC"]),
            Question(question: "Book Soru C", answers: ["Cevap CA", "Cevap CB", "Cevap CC"])
        ],
                 buttonType: .book),
        
        Category(questions: [
            Question(question: "Movie Question 1", answers: ["Answer 1A", "Answer 1B", "Answer 1C"]),
            Question(question: "Movie Question 2", answers: ["Answer 2A", "Answer 2B", "Answer 2C"]),
            Question(question: "Movie Question 3", answers: ["Answer 3A", "Answer 3B", "Answer 3C"])
        ],
                 buttonType: .movie)
    ]
    
    var currentCategoryIndex = 0
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIViews()
    }
    
    private func setUIViews() {
        AnimationHelper.addLottieAnimation(animationName: "wiseMan", viewToAnimate: animationView)
        
        // Don't load questions here
        bookButton.buttonLabel.text = "Book"
        musicButton.buttonLabel.text = "Music"
        movieButton.buttonLabel.text = "Movie"
        setupButtonActions(for: categories[0], categoryButtonType: .music, button: musicButton)
        setupButtonActions(for: categories[0], categoryButtonType: .movie, button: movieButton)
        setupButtonActions(for: categories[0], categoryButtonType: .book, button: bookButton)
        
        DispatchQueue.main.async {
            self.musicButton.backgroundImage.setImage(with: Constants.ButtonImages.Music.getRandImage(), width: 390, height: 150)
            self.movieButton.backgroundImage.setImage(with: Constants.ButtonImages.Movie.getRandImage(), width: 390, height: 150)
            self.bookButton.backgroundImage.setImage(with: Constants.ButtonImages.Book.getRandImage(), width: 390, height: 150)
        }
    }

    
    private func setupButtonActions(for category: Category, categoryButtonType: Constants.ButtonImages.ButtonType, button: CategoryButton) {
        button.tapAction = { [self] in
            let currentAnswers = category.questions[currentQuestionIndex].answers
            switch categoryButtonType {
            case .music:
                self.categoryChoice = Constants.ButtonImages.ButtonType.music
            case .movie:
                self.categoryChoice = Constants.ButtonImages.ButtonType.movie
            case .book:
                self.categoryChoice = Constants.ButtonImages.ButtonType.book
            }
            self.animateUIElements(with: category.buttonType)
        }
    }

    
    private func updateQuestionAndAnswers(for category: Category) {
        let currentQuestion = category.questions[currentQuestionIndex].question
        let currentAnswers = category.questions[currentQuestionIndex].answers
        
        updateQuestionLabel(with: currentQuestion)
        updateButtonLabels(with: currentAnswers)
    }
    
    private func updateQuestionLabel(with text: String) {
        questionLabel.text = text
    }
    
    private func updateButtonLabels(with answers: [String]) {
        musicButton.buttonLabel.text = answers[0]
        movieButton.buttonLabel.text = answers[1]
        bookButton.buttonLabel.text = answers[2]
    }
    
    private func animateUIElements(with buttonType: Constants.ButtonImages.ButtonType) {
        UIView.animate(withDuration: 0.5, animations: {
            self.animationView.alpha = 0.0
            self.bookButton.alpha = 0.0
            self.movieButton.alpha = 0.0
            self.musicButton.alpha = 0.0
        }) { _ in
            let category = self.categories[self.currentCategoryIndex]
            self.currentQuestionIndex = (self.currentQuestionIndex + 1) % category.questions.count
            
            self.updateQuestionAndAnswers(for: category)
            
            UIView.animate(withDuration: 0.5) {
                self.animationView.alpha = 1.0
                self.bookButton.alpha = 1.0
                self.movieButton.alpha = 1.0
                self.musicButton.alpha = 1.0
            }
        }
    }
}
