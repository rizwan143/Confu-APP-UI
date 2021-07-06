//
//  CFLabel.swift
//  ConfuNewDesign
//
//  Created by Shayan on 23/03/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFLabel: UILabel {
//    var edgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
//
//    override func drawText(in rect: CGRect) {
//        super.drawText(in: rect.inset(by: edgeInsets))
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text: String, textColor: UIColor, font: UIFont, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = alignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
