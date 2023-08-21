//
//  CategoryPickerViewController.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 21.08.2023.
//

import UIKit

class CategoryPickerViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var musicButton: CategoryButton!
    @IBOutlet weak var movieButton: CategoryButton!
    @IBOutlet weak var bookButton: CategoryButton!
    
    let url1 = "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"
    let url2 = "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"
    let url3 = "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIViews()
        AnimationHelper.addLottieAnimation(animationName: "wiseMan", viewToAnimate: animationView)

        
    }
    
    private func setUIViews() {
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
            self.musicButton.backgroundImage.setImage(with: self.url1, width: 250, height: 40)
            self.movieButton.backgroundImage.setImage(with: self.url2, width: 250, height: 40)
            self.bookButton.backgroundImage.setImage(with: self.url3, width: 250, height: 40)
        }
    }
    


}
