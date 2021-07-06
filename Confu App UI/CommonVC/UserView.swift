//
//  UserView.swift
//  Confu
//
//  Created by Waleed Khan on 14/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class UserView: UIView {
    
    let nameLabel = CFTitleLabel(fontSize: 14, textColor: .black
                                    //UIColor().titleColor
    )
    
    let lblUserContent = CFTitleLabel(fontSize: 11, textColor: .black)
                                        //UIColor().subTitleColor2)
    
    let btnCancel = CFOutlineButton(title: "Cancel", titleColor: .black)
                                        //UIColor().adminBackgroundColor)
    let btnAccept = CFOutlineButton(title: "Accept", titleColor: .black)
                                        //UIColor().primary)
    
    
//    let btnMessage = CFIconButton(image: UIImage().messageIcon, backgroundColor: UIColor().oPTBackgroundColor, cornerRadius: 15, inkColor: UIColor().titleColor.withAlphaComponent(0.1))
//
//    let btnMute = CFIconButton(image: UIImage().muteMicrophoneIcon, backgroundColor: UIColor().oPTBackgroundColor, cornerRadius: 15, inkColor: UIColor().titleColor.withAlphaComponent(0.1))
//
    let userImage = UIImageView()
    
    let removeParticpantButton = UIButton()
    
    let padding: CGFloat = 0
    
    lazy var svUserInfo = CFStackView(views: [
        nameLabel,
        lblUserContent
    ], axis: .vertical, spacing: 5)
    
    lazy var svAcceptReject = CFStackView(views: [
        btnCancel,
        btnAccept
    ], axis: .horizontal, spacing: 10)
    
    lazy var svMessageAndMicrophone = CFStackView(views: [
//        btnMessage,
//        btnMute
    ], axis: .horizontal, spacing: 20)
    
    lazy var svButtonsStack = CFStackView(views: [
        svAcceptReject,
        svMessageAndMicrophone
    ], axis: .horizontal, spacing: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
            ///UIColor().backgroundColor
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUserImageView() {
        addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.image = #imageLiteral(resourceName: "temp-image")
        userImage.contentMode = .scaleAspectFill
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            userImage.heightAnchor.constraint(equalToConstant: 40),
            userImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func setupNameLabel() {
        addSubview(svUserInfo)
        
        nameLabel.text = "Helloasdfsajkdlflksdlfasjkldlkjfsdlkfalkjklfjsalk"
        lblUserContent.text = "Admin"
        
        nameLabel.font = RobotoFont.medium.size(14)
        lblUserContent.font = RobotoFont.regular.size(11)
        
        NSLayoutConstraint.activate([
            svUserInfo.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
            svUserInfo.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            svUserInfo.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            svUserInfo.centerYAnchor.constraint(equalTo: userImage.centerYAnchor)
        ])
    }
    
    
    private func setupFont() {
//        btnAccept.setTitleFont(RobotoFont.regular.size(11), for: .normal)
//        btnCancel.setTitleFont(RobotoFont.regular.size(11), for: .normal)
        
    }
    
    private func setupButtonStack() {
        addSubview(svButtonsStack)
        NSLayoutConstraint.activate([
            svButtonsStack.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            svButtonsStack.leadingAnchor.constraint(greaterThanOrEqualTo: svUserInfo.trailingAnchor, constant: 10),
            svButtonsStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            svButtonsStack.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    private func setupScreen() {
        setupFont()
        setupUserImageView()
        setupNameLabel()
        setupButtonStack()
    }
}
