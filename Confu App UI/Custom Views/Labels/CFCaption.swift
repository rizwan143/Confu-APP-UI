//
//  CFCaption.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 10/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFCaption: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(labelText: String? = nil, attributedLabelText: NSAttributedString? = nil, labelFont: UIFont? = nil) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let labelText = labelText {
            text = labelText
            font = labelFont
        } else if let attributedLabelText = attributedLabelText {
            attributedText = attributedLabelText
        }
        
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        textColor = .label
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
