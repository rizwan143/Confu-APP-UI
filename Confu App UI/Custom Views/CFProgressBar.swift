//
//  CFProgressBar.swift
//  Confu
//
//  Created by Faizan on 12/08/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import Foundation
import UIKit

class CFProgressBar: UIProgressView {
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        self.progress = 0.2
        self.tintColor = UIColor.red
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
