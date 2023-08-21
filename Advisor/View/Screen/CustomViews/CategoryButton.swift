//
//  CategoryButton.swift
//  Advisor
//
//  Created by Ahmet Ali ÇETİN on 21.08.2023.
//

import UIKit

class CategoryButton: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var buttonTitleSet: String = "" {
        didSet {
            buttonLabel.text = buttonTitleSet
        }
    }
    
    var backgroundImageSet: UIImage? {
        didSet {
            backgroundImage.image = backgroundImageSet
        }
    }
    
    var tapAction: (() -> Void)? {
        didSet {
            addTapGesture()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CategoryButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    @objc private func buttonTapped() {
        tapAction?()
    }
}


