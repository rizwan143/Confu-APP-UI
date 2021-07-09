//
//  CreateProfileView.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CreateProfileView: UIView {
    var createProfileVC: CreateProfileVC? {
        didSet {
            let backItem = UIBarButtonItem(image: UIImage(named: "navBack"), style: .plain, target: createProfileVC, action: #selector(OtpVC.backPressed))
            createProfileVC?.navigationItem.leftBarButtonItem = backItem
            
            createProfileVC?.navigationController?.interactivePopGestureRecognizer?.delegate = createProfileVC
            
            ivAvatarImage.addGestureRecognizer(UITapGestureRecognizer(target: createProfileVC, action: #selector(CreateProfileVC.selectProfileImage)))
            ivAvatarImage.isUserInteractionEnabled = true
            
            actionButton.addTarget(createProfileVC, action: #selector(CreateProfileVC.actionButtonTapped), for: .touchUpInside)
        }
    }

    var uvHeader = UIView()
    
    let lblLargeTitle = CFBodyLabel(text: StaticLabels.cpViewLargeText.rawValue)
  //  let lblBody = CFBodyLabel(text: StaticLabels.cpViewBodyText.rawValue)
    
    let ivAvatarImage = CFAvatarImageView(frame: .zero)
    let editNameImage = CFAvatarImageView(frame: .zero)
    let editEmailImage = CFAvatarImageView(frame: .zero)
    let uploadImage = CFAvatarImageView(frame: .zero)
    let mailImage = CFImageView(frame: .zero)
    let usernameImage = CFImageView(frame: .zero)
    var tfFirstname = CFFloatingTextField("First Name")
    var tfLastname = CFFloatingTextField("Last Name")
    var tfEmail = CFFloatingTextField("Email")
    // var tfCompany = CFFloatingTextField("Company")
  //  var tfAbout = CFFloatingTextField("About Me")
    
    lazy var textFieldStack = CFStackView(views: [
        tfFirstname,
        tfLastname
      //  tfEmail
    ], axis: .horizontal, spacing: 10)
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    var buttonBottomConstraint = NSLayoutConstraint()
    
    let actionButton = CFPrimaryButton(title: "Save", backgroundColor: .black, titleColor: .white)
    
    let padding: CGFloat = 20
    let secondaryPadding: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderView() {
        addSubview(uvHeader)
        
        uvHeader.backgroundColor = .white
        
        uvHeader.translatesAutoresizingMaskIntoConstraints = false
        
//        uvHeader.layer.shadowColor = UIColor.lightGray.cgColor
//        uvHeader.layer.shadowOpacity = 0.3
//        uvHeader.layer.shadowOffset = CGSize(width: 2, height: 2)
//        uvHeader.layer.shadowRadius = 10
        
        NSLayoutConstraint.activate([
            uvHeader.topAnchor.constraint(equalTo: topAnchor),
            uvHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            uvHeader.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    private func setupLargeTitleLabel() {
        addSubview(lblLargeTitle)
        
        lblLargeTitle.font = RobotoFont.black.size(24)
        lblLargeTitle.textColor = .black
        lblLargeTitle.numberOfLines = 1
        lblLargeTitle.textAlignment = .center
        NSLayoutConstraint.activate([
            lblLargeTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            lblLargeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            lblLargeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    

    
    private func setupAvatarImageView() {
        addSubview(ivAvatarImage)
    
        ivAvatarImage.image = UIImage(named: "ImagePlaceholder")
        
        NSLayoutConstraint.activate([
            ivAvatarImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 30),
            ivAvatarImage.centerXAnchor.constraint(equalTo: uvHeader.centerXAnchor),
            ivAvatarImage.bottomAnchor.constraint(equalTo: uvHeader.bottomAnchor, constant: 40),
            ivAvatarImage.heightAnchor.constraint(equalToConstant: 145),
            ivAvatarImage.widthAnchor.constraint(equalToConstant: 145)
        ])
    }
    private func setupUploadImageView() {
        addSubview(uploadImage)
    
        uploadImage.image = UIImage(named: "camera")
        
        NSLayoutConstraint.activate([
           // uploadImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 20),
          //  uploadImage.centerXAnchor.constraint(equalTo: uvHeader.centerXAnchor),
            uploadImage.trailingAnchor.constraint(equalTo: ivAvatarImage.trailingAnchor),
            uploadImage.bottomAnchor.constraint(equalTo: ivAvatarImage.centerYAnchor, constant: 45),
            uploadImage.heightAnchor.constraint(equalToConstant: 45),
            uploadImage.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupMailImageView() {
        addSubview(mailImage)
    
        mailImage.image = UIImage(named: "mail")
        mailImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // uploadImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 20),
//            mailImage.centerXAnchor.constraint(equalTo: tfEmail.centerXAnchor),
         //   mailImage.trailingAnchor.constraint(equalTo: tfEmail.leadingAnchor),
            mailImage.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 95),
            mailImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            mailImage.heightAnchor.constraint(equalToConstant: 16),
            mailImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupUsernameImageView() {
        addSubview(usernameImage)
    
        usernameImage.image = UIImage(named: "username")
        usernameImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // uploadImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 20),
           // usernameImage.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  20),
            usernameImage.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 35),
         //   usernameImage.trailingAnchor.constraint(equalTo: textFieldStack.leadingAnchor),
            usernameImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            usernameImage.heightAnchor.constraint(equalToConstant: 20),
            usernameImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    
    private func setupActionButton() {
        addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupTextFieldStack() {
        
        contentView.addSubview(textFieldStack)
        scrollView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            textFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textFieldStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    private func setupEmailTextField() {
        
        contentView.addSubview(tfEmail)
        scrollView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            tfEmail.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 60),
            tfEmail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            tfEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            tfEmail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: ivAvatarImage.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20)
        ])
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    
    private func setupScreen() {
        setupHeaderView()
        setupLargeTitleLabel()
      //  setupBodyLabel()
        setupAvatarImageView()
        setupActionButton()
        setupScrollView()
        setupContentView()
        setupTextFieldStack()
        setupEmailTextField()
        setupUploadImageView()
        setupMailImageView()
        setupUsernameImageView()
       
    }
}
