//
//  CFOtpTextField.swift
//  ConfuNewDesign
//
//  Created by Shayan on 01/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFOtpTextField: UITextField {
    weak var previousTextField: CFOtpTextField?
    weak var nextTextField: CFOtpTextField?
    
    override public func deleteBackward() {
        if text == "" {
            previousTextField?.becomeFirstResponder()
        }
    }
}
