//
//  CFSlider.swift
//  Confu
//
//  Created by Waleed Khan on 22/06/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit
import MaterialComponents

class CFSlider: MDCSlider {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isStatefulAPIEnabled = true
        self.setTrackBackgroundColor(.black, for: .normal)
        self.setTrackFillColor(.black, for: .normal)
        self.setThumbColor(.black, for: .normal)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.setThumbColor(.red, for: .selected)
    }
    
}
