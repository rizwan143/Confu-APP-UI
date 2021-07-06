//
//  CFPhoneNumberField.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 10/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit
import PhoneNumberKit

class CFPhoneNumberField: PhoneNumberTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        borderStyle = .none
        backgroundColor = .black
        layer.masksToBounds = false
//        withPrefix = true
        withExamplePlaceholder = true
        withFlag = true

        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        
        font = RobotoFont.regular.size(30)
        textColor = .white
    }
}
