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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUIViews()
        
    }
    
    private func setUIViews() {
        AnimationHelper.addLottieAnimation(animationName: "wiseMan", viewToAnimate: animationView)
        
        musicButton.buttonLabel.text = "Music"
        musicButton.tapAction = {
            print("music button basıldı")
        }
        
        movieButton.buttonLabel.text = "Movie"
        movieButton.tapAction = {
            print("movie button basıldı")
        }
        
        bookButton.buttonLabel.text = "Book"
        bookButton.tapAction = {
            print("book button basıldı")
        }
        
        DispatchQueue.main.async {
            self.musicButton.backgroundImage.setImage(with: Constants.ButtonImages.Music.getRandImage(), width: 390, height: 150)
            self.movieButton.backgroundImage.setImage(with: Constants.ButtonImages.Movie.getRandImage(), width: 390, height: 150)
            self.bookButton.backgroundImage.setImage(with: Constants.ButtonImages.Book.getRandImage(), width: 390, height: 150)
        }
    }
    


}
