//
//  CategoryPickerViewModel.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 27.08.2023.
//

import Foundation

protocol CategoryPickerViewModelDelegate: AnyObject {
    func updateQuestionLabel(with text: String)
    func updateButtonLabels(with answers: [String])
}

class CategoryPickerViewModel {
    weak var delegate: CategoryPickerViewModelDelegate?
    
    var categories: [Category]
    var currentCategoryIndex = 0
    var currentQuestionIndex = 0
    
    var categoryQuestions: [Constants.ButtonImages.ButtonType: [Question]] = [:]
    
    init() {
        self.categories = []
        self.categories = prepareCategories()
    }
    
    private func prepareCategories() -> [Category] {
        categoryQuestions[.music] = [
            Question(question: "Music Soru 1", answers: ["Cevap 1A", "Cevap 1B", "Cevap 1C"]),
            Question(question: "Music Soru 2", answers: ["Cevap 2A", "Cevap 2B", "Cevap 2C"]),
            Question(question: "Music Soru 3", answers: ["Cevap 3A", "Cevap 3B", "Cevap 3C"])
        ]
        
        categoryQuestions[.book] = [
            Question(question: "Book Soru A", answers: ["Cevap AA", "Cevap AB", "Cevap AC"]),
            Question(question: "Book Soru B", answers: ["Cevap BA", "Cevap BB", "Cevap BC"]),
            Question(question: "Book Soru C", answers: ["Cevap CA", "Cevap CB", "Cevap CC"])
        ]
        
        categoryQuestions[.movie] = [
            Question(question: "Movie Question 1", answers: ["Answer 1A", "Answer 1B", "Answer 1C"]),
            Question(question: "Movie Question 2", answers: ["Answer 2A", "Answer 2B", "Answer 2C"]),
            Question(question: "Movie Question 3", answers: ["Answer 3A", "Answer 3B", "Answer 3C"])
        ]
        
        var preparedCategories: [Category] = []
        for (buttonType, questions) in categoryQuestions {
            let category = Category(questions: questions, buttonType: buttonType)
            preparedCategories.append(category)
        }
        
        return preparedCategories
    }
    
    func getMusicQuestions() -> [Question] {
        return categories.first { $0.buttonType == .music }?.questions ?? []
    }
    
    func getBookQuestions() -> [Question] {
        return categories.first { $0.buttonType == .book }?.questions ?? []
    }
    
    func getMovieQuestions() -> [Question] {
        return categories.first { $0.buttonType == .movie }?.questions ?? []
    }
    
    func getCurrentCategory() -> Category {
        return categories[currentCategoryIndex]
    }
    
    func getCurrentQuestionAndAnswers() -> (String, [String]) {
        let currentCategory = getCurrentCategory()
        let currentQuestion = currentCategory.questions[currentQuestionIndex]
        return (currentQuestion.question, currentQuestion.answers)
    }
    
    func moveToNextQuestion() {
        let currentCategory = getCurrentCategory()
        currentQuestionIndex = (currentQuestionIndex + 1) % currentCategory.questions.count
    }
    
    func moveToNextCategory() {
        currentCategoryIndex = (currentCategoryIndex + 1) % categories.count
        currentQuestionIndex = 0
    }
    
    func updateQuestionLabel(with text: String) {
        delegate?.updateQuestionLabel(with: text)
    }
    
    func updateButtonLabels(with answers: [String]) {
        delegate?.updateButtonLabels(with: answers)
    }
    
    func setCurrentCategoryQuestions(_ questions: [Question]) {
        categoryQuestions[getCurrentCategory().buttonType] = questions
    }
}
