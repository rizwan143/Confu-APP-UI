//
//  CFStackView.swift
//  ConfuNewDesign
//
//  Created by Shayan on 23/03/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init(views: [UIView], axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution? = .fillEqually, alignment: UIStackView.Alignment? = .fill, spacing: CGFloat) {
        super.init(frame: .zero)
        
        for view in views {
            addArrangedSubview(view)
        }
        
        self.axis = axis
        self.spacing = spacing
        
        self.distribution = distribution!
        self.alignment = alignment!
        
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}
