//
//  CFPrimaryButton.swift
//  NewProgrammaticUI
//
//  Created by Shayan on 24/04/2020.
//  Copyright © 2020 Confu002. All rights reserved.
//

import UIKit
import MaterialComponents

class CFPrimaryButton: MDCButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, backgroundColor: UIColor, titleColor: UIColor) {
        super.init(frame: .zero)
        
        let containerScheme = globalContainerScheme()
        self.applyContainedTheme(withScheme: containerScheme)
        
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setShadowColor(backgroundColor, for: .normal)
        self.setElevation(ShadowElevation(rawValue: 10), for: .normal)
        
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.setTitleFont(RobotoFont.medium.size(16), for: .normal)
        sizeToFit()
    }
    
    func globalContainerScheme() -> MDCContainerScheming {
        let containerScheme = MDCContainerScheme()
        return containerScheme
    }
    
}
