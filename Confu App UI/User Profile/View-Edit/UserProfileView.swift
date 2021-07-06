////
////  UserProfileView.swift
////  ConfuNewDesign
////
////  Created by Shayan on 02/04/2020.
////  Copyright © 2020 Shayan Zahid. All rights reserved.
////
//
//import UIKit
//
//class UserProfileView: UIView {
//    var userProfileVC: UserProfileVC? {
//        didSet {
//            let backItem = UIBarButtonItem(image: UIImage(named: "navBack"), style: .plain, target: userProfileVC, action: #selector(UserProfileVC.backTapped))
//            userProfileVC?.navigationItem.leftBarButtonItem = backItem
//            
//            userProfileVC?.navigationController?.interactivePopGestureRecognizer?.delegate = userProfileVC
//            
//            avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: userProfileVC, action: #selector(UserProfileVC.selectProfileImage)))
//            avatarImageView.isUserInteractionEnabled = true
//
//        }
//    }
//    
//    let avatarImageView = CFAvatarImageView(frame: .zero)
//    let usernameLabel = CFTitleLabel(fontSize: 20, textColor: UIColor().titleColor)
//    let phoneNumberLabel = CFTitleLabel(fontSize: 13, textColor: UIColor().subTitleColor)
//    
//    lazy var labelsStack = CFStackView(views: [
//        usernameLabel,
//        phoneNumberLabel
//    ], axis: .vertical, spacing: 5)
//    
//    let scrollView = UIScrollView()
//    let contentView = UIView()
//    
//    
//    var buttonBottomConstraint = NSLayoutConstraint()
//    
//    let actionButton = CFPrimaryButton(title: "Save changes", backgroundColor: UIColor().primary, titleColor: .white)
//    
//    let usernameTextField = CFFloatingTextField("User name")
//    let designationTextField = CFFloatingTextField("Designation")
//    let departmentTextField = CFFloatingTextField("Department")
//    let companyTextField = CFFloatingTextField("Company")
//    let aboutTextField = CFFloatingTextField("About Me")
//    
//    lazy var textFieldStack = CFStackView(views: [
//        usernameTextField,
//        designationTextField,
//        departmentTextField,
//        companyTextField,
//        aboutTextField
//    ], axis: .vertical, spacing: 10)
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
//    private func setupFont() {
//        usernameLabel.font = RobotoFont.bold.size(20)
//        phoneNumberLabel.font = RobotoFont.medium.size(12)
//        
//        usernameLabel.textAlignment = .center
//        phoneNumberLabel.textAlignment = .center
//    }
//    
//    private func setupAvatarImageView() {
//        addSubview(avatarImageView)
//        
//        NSLayoutConstraint.activate([
//            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
//            avatarImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
//            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
//            avatarImageView.widthAnchor.constraint(equalToConstant: 80)
//        ])
//    }
//    
//    private func setupLabelsStack() {
//        addSubview(labelsStack)
//        
//        usernameLabel.text = "Muhammad Shayan Zahid"
//        phoneNumberLabel.text = "+92 3349859980"
//        
//        NSLayoutConstraint.activate([
//            labelsStack.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
//            labelsStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
//            labelsStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
//        ])
//    }
//    
//    private func setupTextFieldStack() {
//        
//        contentView.addSubview(textFieldStack)
//        scrollView.backgroundColor = .clear
//        
//        NSLayoutConstraint.activate([
//            textFieldStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
//            textFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
//            textFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
//            textFieldStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
//    
//    private func setupScrollView() {
//        addSubview(scrollView)
//        
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .clear
//        NSLayoutConstraint.activate([
//            
//            scrollView.topAnchor.constraint(equalTo: labelsStack.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
//
//        ])
//    }
//    
//    private func setupContentView() {
//        scrollView.addSubview(contentView)
//
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//        ])
//    }
//    
//    private func setupActionButton() {
//        addSubview(actionButton)
//        
//        buttonBottomConstraint = actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
//        
//        NSLayoutConstraint.activate([
//            actionButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30),
//            buttonBottomConstraint,
//            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//            actionButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//    
//    private func setupScreen() {
//        setupFont()
//        setupAvatarImageView()
//        setupLabelsStack()
//        setupScrollView()
//        setupContentView()
//        setupTextFieldStack()
//        setupActionButton()
//    }
//}
