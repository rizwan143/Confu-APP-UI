//
//  CFImageView.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 12/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFImageView: UIImageView {
    var isRounded = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(viewImage: UIImage = UIImage(), isRounded: Bool = false) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        image = viewImage
        contentMode = .scaleAspectFill
        self.isRounded = isRounded
    }
    
    init(viewImage: UIImage) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        image = viewImage
        contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        if isRounded {
            layer.cornerRadius = bounds.height / 2
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
