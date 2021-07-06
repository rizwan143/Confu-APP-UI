//
//  CFBodyLabel.swift
//  NewProgrammaticUI
//
//  Created by Shayan on 24/04/2020.
//  Copyright © 2020 Confu002. All rights reserved.
//

import UIKit

class CFBodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.text = text
        
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        font = RobotoFont.regular.size(13)
        textColor = .white
    }
}
