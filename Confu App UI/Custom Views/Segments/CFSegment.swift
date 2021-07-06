//
//  CFSegment.swift
//  ConfuNewDesign
//
//  Created by Shayan on 24/03/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFSegment: UISegmentedControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(segments: [String], backgroundColor: UIColor, tintColor: UIColor) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        for index in 0..<segments.count {
            insertSegment(withTitle: segments[index], at: index, animated: true)
        }
        
        self.selectedSegmentIndex = 0
        
        self.backgroundColor = backgroundColor
        self.selectedSegmentTintColor = tintColor
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.font: FontBook.titleRegularSmall.font,
            NSAttributedString.Key.foregroundColor: UIColor.systemGray
        ], for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
