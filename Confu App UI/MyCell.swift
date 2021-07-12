//
//  MyCell.swift
//  Programmatic Tab Bar Controller Example
//
//  Created by Rizwan  Rana on 02/07/2021.
//  Copyright © 2021 Grant Elliott. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    let avatarImage = CFImageView(frame: .zero)
    let lblBody = CFBodyLabel(text: StaticLabels.vpNumberViewBodyText.rawValue)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreen()
    }
    private func setupAvatarImageView() {
        addSubview(avatarImage)
    
        avatarImage.image = UIImage(named: "image1")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.layer.cornerRadius = 12
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           // avatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 70),
            avatarImage.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    private func setupTitleLabel() {
        addSubview(lblBody)
        
        lblBody.font = RobotoFont.regular.size(12)
        lblBody.textColor = .black
        lblBody.numberOfLines = 1
        lblBody.textAlignment = .center
        NSLayoutConstraint.activate([
            lblBody.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10),
            lblBody.leadingAnchor.constraint(equalTo: leadingAnchor),
            lblBody.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupScreen() {
        setupAvatarImageView()
        setupTitleLabel()
        
    }
}
