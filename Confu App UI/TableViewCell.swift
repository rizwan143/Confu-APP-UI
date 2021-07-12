//
//  TableViewCell.swift
//  Programmatic Tab Bar Controller Example
//
//  Created by Rizwan  Rana on 02/07/2021.
//  Copyright © 2021 Grant Elliott. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let avatarImage = CFImageView(frame: .zero)
    let lblBody = CFBodyLabel(text: "")
    let checkMarkImage = CFImageView(frame: .zero)
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAvatarImageView() {
        addSubview(avatarImage)
    
        avatarImage.image = UIImage(named: "image1")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
           // avatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 40),
            avatarImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func setupTitleLabel() {
        addSubview(lblBody)
        
        lblBody.font = RobotoFont.medium.size(16)
        lblBody.textColor = .black
        lblBody.numberOfLines = 1
        lblBody.textAlignment = .center
        NSLayoutConstraint.activate([
           // lblBody.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lblBody.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
            lblBody.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 12),
           
        ])
    }
    private func setupCheckmarkImageView() {
        addSubview(checkMarkImage)
    
        checkMarkImage.image = UIImage(named: "uncheck")
        checkMarkImage.translatesAutoresizingMaskIntoConstraints = false
       // checkMarkImage.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            checkMarkImage.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
            checkMarkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 350),
            checkMarkImage.heightAnchor.constraint(equalToConstant: 28),
            checkMarkImage.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
    private func setupScreen() {
        setupAvatarImageView()
        setupTitleLabel()
        setupCheckmarkImageView() 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
