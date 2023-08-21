//
//  UIImageViewExtension.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 21.08.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String, width: CGFloat, height: CGFloat) {
        guard let url = URL(string: urlString) else {
            print("Kingfisher URL error")
            return
        }
        
        let processor = DownsamplingImageProcessor(size: CGSize(width: width, height: height))
        kf.indicatorType = .activity
        kf.setImage(
            with: url,
            placeholder: nil,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
    }
}
