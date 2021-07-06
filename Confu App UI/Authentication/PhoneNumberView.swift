////
////  PhoneNumberView.swift
////  ConfuNewDesign
////
////  Created by Shayan Zahid on 10/02/2020.
////  Copyright © 2020 Shayan Zahid. All rights reserved.
////
//
//import UIKit
//
//class PhoneNumberView: UIView {
//    var phoneNumberVC: PhoneNumberVC? {
//        didSet {
//            actionButton.addTarget(phoneNumberVC, action: #selector(PhoneNumberVC.actionButtonTapped), for: .touchUpInside)
//        }
//    }
//    
//    // Classes starting with CF are our custom subclassed UILabels, UIButtons, UITextFields etc
//    
//    private let largeTitleLabel = CFLargeTitleLabel(text: StaticLabels.pnViewLargeText.rawValue, textColor: UIColor().titleColor)
//    private let bodyLabel = CFBodyLabel(text: StaticLabels.pnViewBodyText.rawValue)
//    
//    let actionButton = CFPrimaryButton(title: "Continue", backgroundColor: UIColor().primary, titleColor: .white)
//    
//    var tfPhoneNumber = CFPhoneNumberField()
//    
//    var buttonBottomConstraint = NSLayoutConstraint()
//    
//    let padding: CGFloat = 20
//    let secondaryPadding: CGFloat = 20
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        backgroundColor = UIColor().backgroundColor
//        
//        setupScreen()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupLargeTitleLabel() {
//        addSubview(largeTitleLabel)
//        
//        largeTitleLabel.numberOfLines = 2
//        
//        NSLayoutConstraint.activate([
//            largeTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
//            largeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            largeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
//        ])
//    }
//    
//    private func setupBodyLabel() {
//        addSubview(bodyLabel)
//        
//        bodyLabel.textColor = UIColor().titleColor
//        
//        bodyLabel.numberOfLines = 3
//        
//        NSLayoutConstraint.activate([
//            bodyLabel.topAnchor.constraint(equalTo: largeTitleLabel.bottomAnchor, constant: 8),
//            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
//        ])
//    }
//    
//    private func setupPhoneNumberTextField() {
//        addSubview(tfPhoneNumber)
//        
//        tfPhoneNumber.backgroundColor = .clear
//        tfPhoneNumber.textColor = UIColor().titleColor
//        
////        let color = UIColor.lightGray
////        tfPhoneNumber.attributedPlaceholder = NSAttributedString(string: "0123456790", attributes: [NSAttributedString.Key.foregroundColor : color])
//        
//        
//        NSLayoutConstraint.activate([
//            tfPhoneNumber.centerYAnchor.constraint(equalTo: centerYAnchor),
//            tfPhoneNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
//            tfPhoneNumber.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -5),
//            tfPhoneNumber.heightAnchor.constraint(equalToConstant: 60.0)
//        ])
//    }
//    
//    private func setupActionButton() {
//        addSubview(actionButton)
//        buttonBottomConstraint = actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//        
//        NSLayoutConstraint.activate([
//            buttonBottomConstraint,
//            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: secondaryPadding),
//            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -secondaryPadding),
//            actionButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//    
//    private func setupScreen() {
//        setupLargeTitleLabel()
//        setupBodyLabel()
//        setupPhoneNumberTextField()
//        setupActionButton()
//    }
//}
