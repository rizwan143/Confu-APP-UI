//
//  CFTextField.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 12/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFTextField: UITextField {
    var padding: UIEdgeInsets?
    
    var textFont = FontBook.heading.font
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding!)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding!)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(placeholderText: String, leftImage: UIImage? = nil) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        padding = UIEdgeInsets(top: 0, left: 5.0, bottom: 0, right: 5.0)
        
        borderStyle = .none
        backgroundColor = .systemBackground
        layer.masksToBounds = false
        font = textFont
        
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        
        placeholder = placeholderText
        textColor = .label
        
        if let leftImage = leftImage {
            padding = UIEdgeInsets(top: 0, left: 35.0, bottom: 0, right: 5.0)
            leftViewMode = .always
            let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
            imageContainerView.addSubview(imageView)
            imageView.contentMode = .scaleAspectFill
            imageView.image = leftImage
            leftView = imageContainerView
        }
    }
    
    init(placeholderText: String, leftImage: UIImage? = nil, rightContainerView: UIView? = nil) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        padding = UIEdgeInsets(top: 0, left: 5.0, bottom: 0, right: 5.0)
        
        borderStyle = .none
        backgroundColor = .systemBackground
        layer.masksToBounds = false
        font = textFont
        
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        
        placeholder = placeholderText
        textColor = .label
        
        if let leftImage = leftImage {
            padding = UIEdgeInsets(top: 0, left: 35.0, bottom: 0, right: 5.0)
            leftViewMode = .always
            let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
            imageContainerView.addSubview(imageView)
            imageView.contentMode = .scaleAspectFill
            imageView.image = leftImage
            leftView = imageContainerView
        }
        
        if let rightContainerView = rightContainerView {
            padding = UIEdgeInsets(top: 0, left: 35.0, bottom: 0, right: 35.0)
            rightViewMode = .always
            let switchView = UISwitch(frame: CGRect(x: -10.0, y: -8.0, width: 0, height: 0))
            rightContainerView.addSubview(switchView)
            rightView = rightContainerView
        }
    }
    
    init(placeholderText: String, rightContainerView: UIView? = nil) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        padding = UIEdgeInsets(top: 0, left: 5.0, bottom: 0, right: 35.0)
        
        borderStyle = .none
        backgroundColor = .systemBackground
        layer.masksToBounds = false
        font = textFont
        
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        
        placeholder = placeholderText
        textColor = .label
        
        if let rightContainerView = rightContainerView {
            rightViewMode = .always
            let switchView = UISwitch(frame: CGRect(x: -10.0, y: -8.0, width: 0, height: 0))
            rightContainerView.addSubview(switchView)
            rightView = rightContainerView
        }
    }
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        padding = UIEdgeInsets(top: 0, left: 5.0, bottom: 0, right: 35.0)
        
        borderStyle = .none
        backgroundColor = .systemBackground
        layer.masksToBounds = false
        font = textFont
        
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        
        placeholder = placeholderText
        textColor = .label
    }
    
    init(leftText: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        padding = UIEdgeInsets(top: 0, left: 130.0, bottom: 0, right: 10.0)
        
        borderStyle = .none
        backgroundColor = .systemBackground
        layer.masksToBounds = false
        
        font = textFont
        
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        
        textColor = .label
        textAlignment = .right
        
        leftViewMode = .always
        let leftTextContainerView = UIView(frame: CGRect(x: 10, y: 0, width: 120, height: 40))
        let textFieldTag = UILabel(frame: CGRect(x: 10, y: 0, width: 120, height: 40))
        leftTextContainerView.addSubview(textFieldTag)
        textFieldTag.text = leftText
        leftView = leftTextContainerView
    }
    
    init(viewText: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        padding = UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)
        
        borderStyle = .none
        backgroundColor = .systemBackground
        layer.masksToBounds = false
        
        font = textFont
        
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        
        textColor = .label
        textAlignment = .left
        
        text = viewText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
