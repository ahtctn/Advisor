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
    
    var viewModel: CategoryPickerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIViews()
        viewModel = CategoryPickerViewModel()
        viewModel.delegate = self
    }
    
    private func setUIViews() {
        AnimationHelper.addLottieAnimation(animationName: "wiseMan", viewToAnimate: animationView)
        
        setupButtonActions(buttonType: .music, button: musicButton)
        setupButtonActions(buttonType: .movie, button: movieButton)
        setupButtonActions(buttonType: .book, button: bookButton)
        
        DispatchQueue.main.async {
            self.musicButton.backgroundImage.setImage(with: Constants.ButtonImages.Music.getRandImage(), width: 390, height: 150)
            self.movieButton.backgroundImage.setImage(with: Constants.ButtonImages.Movie.getRandImage(), width: 390, height: 150)
            self.bookButton.backgroundImage.setImage(with: Constants.ButtonImages.Book.getRandImage(), width: 390, height: 150)
        }
    }

    private func setupButtonActions(buttonType: Constants.ButtonImages.ButtonType, button: CategoryButton) {
        button.tapAction = { [weak self] in
            guard let self = self else { return }
            self.categoryChoice = buttonType
            self.animateUIElements()
        }
    }
    
    private func updateUI() {
        let (currentQuestion, currentAnswers) = viewModel.getCurrentQuestionAndAnswers()
        viewModel.updateQuestionLabel(with: currentQuestion)
        viewModel.updateButtonLabels(with: currentAnswers)
    }
    
    private func animateUIElements() {
        UIView.animate(withDuration: 0.5, animations: {
            self.animationView.alpha = 0.0
            self.bookButton.alpha = 0.0
            self.movieButton.alpha = 0.0
            self.musicButton.alpha = 0.0
        }) { _ in
            self.viewModel.moveToNextQuestion()
            self.updateUI()
            UIView.animate(withDuration: 0.5) {
                self.animationView.alpha = 1.0
                self.bookButton.alpha = 1.0
                self.movieButton.alpha = 1.0
                self.musicButton.alpha = 1.0
            }
        }
    }
}

extension CategoryPickerViewController: CategoryPickerViewModelDelegate {
    func updateQuestionLabel(with text: String) {
        questionLabel.text = text
    }
    
    func updateButtonLabels(with answers: [String]) {
        musicButton.buttonLabel.text = answers[0]
        movieButton.buttonLabel.text = answers[1]
        bookButton.buttonLabel.text = answers[2]
    }
}
