//
//  CFLargeTitleLabel.swift
//  NewProgrammaticUI
//
//  Created by Shayan on 24/04/2020.
//  Copyright © 2020 Confu002. All rights reserved.
//

import UIKit

class CFLargeTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String, textColor: UIColor = .white) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        font = RobotoFont.black.size(30)
        adjustsFontSizeToFitWidth = false
        minimumScaleFactor = 0.85
        lineBreakMode = .byTruncatingTail
    }
}
