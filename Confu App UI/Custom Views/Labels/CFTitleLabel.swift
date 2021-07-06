//
//  CFTitleLabel.swift
//  NewProgrammaticUI
//
//  Created by Shayan on 25/04/2020.
//  Copyright © 2020 Confu002. All rights reserved.
//

import UIKit

class CFTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat, textColor: UIColor) {
        super.init(frame: .zero)
        
        self.font = RobotoFont.regular.size(fontSize)
        self.textColor = textColor
        
        setup()
    }
    
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
//        adjustsFontSizeToFitWidth = true
//        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
