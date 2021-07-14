//
//  OnCallCollectionViewCell.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 14/07/2021.
//

import UIKit

class OnCallCollectionViewCell: UICollectionViewCell {
    let avatarImage = CFImageView(frame: .zero)
    let lblUsername = CFBodyLabel(text: "Faizan")
    var avatarHeight = 80
    var avatarWidth = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreen()
    }
    private func setupAvatarImageView() {
        addSubview(avatarImage)
    
        avatarImage.image = UIImage(named: "image1")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           // avatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: CGFloat(avatarHeight)),
            avatarImage.widthAnchor.constraint(equalToConstant: CGFloat(avatarWidth))
        ])
        avatarImage.layer.cornerRadius = 40
        avatarImage.layoutIfNeeded()
        avatarImage.layer.setNeedsLayout()
    }
    private func setupTitleLabel() {
        addSubview(lblUsername)
        
        lblUsername.font = RobotoFont.regular.size(12)
        lblUsername.textColor = .black
        lblUsername.numberOfLines = 1
        lblUsername.textAlignment = .center
        NSLayoutConstraint.activate([
            lblUsername.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
            lblUsername.leadingAnchor.constraint(equalTo: leadingAnchor),
            lblUsername.trailingAnchor.constraint(equalTo: trailingAnchor)
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
