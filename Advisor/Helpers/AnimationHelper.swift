//
//  AnimationHelper.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 21.08.2023.
//

import UIKit
import Lottie

class AnimationHelper {
    static func addLottieAnimation(animationName: String, viewToAnimate: UIView?) {
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        viewToAnimate!.addSubview(animationView)
        
        // Auto Layout constraints ekleme
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: viewToAnimate!.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: viewToAnimate!.centerYAnchor).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 250).isActive = true  // Görünümün genişliğini ayarlayın
        animationView.heightAnchor.constraint(equalToConstant: 250).isActive = true // Görünümün yüksekliğini ayarlayın
        
        
        // Gölge efekti ekleme
        animationView.layer.shadowColor = UIColor.gray.cgColor
        animationView.layer.shadowOpacity = 1
        animationView.layer.shadowOffset = CGSize(width: 0, height: 6)
        animationView.layer.shadowRadius = 10
        
        animationView.play()
    }
}

