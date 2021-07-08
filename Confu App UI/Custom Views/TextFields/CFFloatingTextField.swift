//
//  CFFloatingTextField.swift
//  NewProgrammaticUI
//
//  Created by Faizan on 20/04/2020.
//  Copyright © 2020 Confu002. All rights reserved.
//

import UIKit
import MaterialComponents

class CFFloatingTextField: UIView {

    var textField = MDCUnderlinedTextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(_ labelText: String, text: String? = nil) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        textField.label.text = labelText
        
//        textField.setOutlineColor(UIColor().titleColor, for: .editing)
//        textField.setOutlineColor(UIColor().subTitleColor, for: .normal)
//        textField.setTextColor(UIColor().titleColor, for: .editing)
//        textField.setTextColor(UIColor().titleColor, for: .normal)
//        textField.setFloatingLabelColor(UIColor().subTitleColor, for: .editing)
//        textField.setFloatingLabelColor(UIColor().subTitleColor, for: .normal)
//        textField.setNormalLabelColor(UIColor().subTitleColor, for: .normal)
//
        
        if text != nil {
            textField.insertText(text!)
        }
        textField.sizeToFit()
        setFont()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setFont() {
        textField.font = RobotoFont.medium.size(14)
        textField.label.font = RobotoFont.regular.size(11)
    }
}
