//
//  CFButtonText.swift
//  Confu
//
//  Created by Waleed Khan on 22/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit
import MaterialComponents

class CFButtonText: MDCButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        
        let containerScheme = globalContainerScheme()
        self.applyTextTheme(withScheme: containerScheme)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.inkColor = titleColor.withAlphaComponent(0.2)
        self.titleLabel?.adjustsFontSizeToFitWidth = false
        self.setTitleFont(RobotoFont.regular.size(12), for: .normal)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
    }
    
    func globalContainerScheme() -> MDCContainerScheming {
        let containerScheme = MDCContainerScheme()
        return containerScheme
    }
    
}

