//
//  CFButton.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(buttonText: String, backgroundColor: UIColor = Colors.seaBreezePrimary, titleColor: UIColor = .white) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setTitle(buttonText, for: .normal)
        self.backgroundColor = backgroundColor
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = FontBook.heading.font
    }
    
    init(buttonImage: UIImage) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setBackgroundImage(buttonImage, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
//        print("Button height 1: \(bounds.height)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
