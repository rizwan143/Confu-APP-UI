//
//  CFIconButton.swift
//  Confu
//
//  Created by Shayan on 27/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit
import MaterialComponents

class CFIconButton: MDCButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: UIImage, backgroundColor: UIColor, cornerRadius: CGFloat, inkColor: UIColor) {
        super.init(frame: .zero)
        
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.backgroundColor = backgroundColor
        self.setShadowColor(.clear, for: .normal)
        self.inkColor = inkColor
        
        setup()
        
        setupImage(image: image, height: cornerRadius)
    }
    
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.sizeToFit()
    }
    
    private func setupImage(image: UIImage, height: CGFloat) {
        let imageView = UIImageView()
        imageView.image = image
        addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalToConstant: height)
        ])
    }
    
}
