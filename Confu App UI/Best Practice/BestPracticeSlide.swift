//
//  BestPracticeSlide.swift
//  Confu
//
//  Created by Shayan on 01/05/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class BestPracticeSlide: UIView {
    let largeTitleLabel = CFLargeTitleLabel(text: "", textColor:.black)
    let smallTitleLabel = CFTitleLabel(fontSize: 14, textColor: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(largeTitle: String, smallTitle: String) {
        super.init(frame: .zero)
        
        self.largeTitleLabel.text = largeTitle
        self.smallTitleLabel.text = smallTitle
        
        setupViews()
    }
    
    private func setupLargeTitleLabel() {
        addSubview(largeTitleLabel)
        
        largeTitleLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            largeTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            largeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            largeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupSmallTitleLabel() {
        addSubview(smallTitleLabel)
        
        smallTitleLabel.textAlignment = .right
        smallTitleLabel.numberOfLines = 5
        
        NSLayoutConstraint.activate([
            smallTitleLabel.topAnchor.constraint(equalTo: largeTitleLabel.bottomAnchor, constant: 10),
            smallTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            smallTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupViews() {
        setupLargeTitleLabel()
        setupSmallTitleLabel()
    }
}
