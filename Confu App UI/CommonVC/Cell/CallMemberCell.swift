//
//  CallMemberCell.swift
//  Confu
//
//  Created by Waleed Khan on 14/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CallMemberCell: UITableViewCell {
    static let reuseID = "com.callMemberCell.confu"
    
    let uvUserView = UserView()
    
    let padding: CGFloat = 30.0
    
    let secondaryPadding: CGFloat = 20.0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        self.selectionStyle = .none
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserInfoView() {
        addSubview(uvUserView)
        uvUserView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            uvUserView.topAnchor.constraint(equalTo: topAnchor, constant: secondaryPadding),
            uvUserView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            uvUserView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            uvUserView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -secondaryPadding)
        ])
    }
    
    private func setupViews() {
        setupUserInfoView()
    }
}
