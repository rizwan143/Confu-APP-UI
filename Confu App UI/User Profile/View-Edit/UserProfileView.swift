//
//  UserProfileView.swift
//  ConfuNewDesign
//
//  Created by Shayan on 02/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

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
//    let usernameLabel = CFTitleLabel(fontSize: 20, textColor: .blue)
//    let phoneNumberLabel = CFTitleLabel(fontSize: 13, textColor: .black)
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
//    let actionButton = CFPrimaryButton(title: "Save changes", backgroundColor: .black, titleColor: .white)
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
//        backgroundColor = .white
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
////    private func setupScreen() {
////        setupFont()
////        setupAvatarImageView()
////        setupLabelsStack()
////        setupScrollView()
////        setupContentView()
////        setupTextFieldStack()
////        setupActionButton()
////    }
//
//}
//
//  CreateProfileView.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class UserProfileView: UIView {
    var userProfileVC: UserProfileVC? {
                didSet {
                    let backItem = UIBarButtonItem(image: UIImage(named: "navBack"), style: .plain, target: userProfileVC, action: #selector(UserProfileVC.backTapped))
                    userProfileVC?.navigationItem.leftBarButtonItem = backItem
                    userProfileVC?.navigationItem.title = "Profile"
                    userProfileVC?.navigationController?.interactivePopGestureRecognizer?.delegate = userProfileVC
        
                    ivAvatarImage.addGestureRecognizer(UITapGestureRecognizer(target: userProfileVC, action: #selector(UserProfileVC.selectProfileImage)))
                    ivAvatarImage.isUserInteractionEnabled = true
                    
                    editEmailImage.addGestureRecognizer(UITapGestureRecognizer(target: userProfileVC, action: #selector(UserProfileVC.actionButtonTapped)))
                    editEmailImage.isUserInteractionEnabled = true
                    
                    editNameImage.addGestureRecognizer(UITapGestureRecognizer(target: userProfileVC, action: #selector(UserProfileVC.actionButtonTapped)))
                    editNameImage.isUserInteractionEnabled = true
                    
                    
        
                }
            }

    var uvHeader = UIView()
    
    let textFieldBottomTitle = CFBodyLabel(text: StaticLabels.cpnameVisibilityText.rawValue)
  //  let lblBody = CFBodyLabel(text: StaticLabels.cpViewBodyText.rawValue)
    
    let ivAvatarImage = CFAvatarImageView(frame: .zero)
    let uploadImage = CFAvatarImageView(frame: .zero)
    let mailImage = CFImageView(frame: .zero)
    let phoneImage = CFImageView(frame: .zero)
    let usernameImage = CFImageView(frame: .zero)
    var tfuserName = CFFloatingTextField("User Name")
    var tfPhone = CFFloatingTextField("Phone")
    var tfEmail = CFFloatingTextField("Email")
    
    let editNameImage = CFImageView(frame: .zero)
    let editEmailImage = CFImageView(frame: .zero)
    // var tfCompany = CFFloatingTextField("Company")
  //  var tfAbout = CFFloatingTextField("About Me")
    
    lazy var textFieldStack = CFStackView(views: [
        tfuserName,
        tfPhone,
        tfEmail
    ], axis: .vertical, spacing: 30)
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    var buttonBottomConstraint = NSLayoutConstraint()
    
   // let actionButton = CFPrimaryButton(title: "Save", backgroundColor: .black, titleColor: .white)
    
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
        addSubview(textFieldBottomTitle)
        textFieldBottomTitle.translatesAutoresizingMaskIntoConstraints = false
        textFieldBottomTitle.font = RobotoFont.regular.size(13)
        textFieldBottomTitle.textColor = .black
        textFieldBottomTitle.numberOfLines = 1
        textFieldBottomTitle.textAlignment = .center
        NSLayoutConstraint.activate([
            textFieldBottomTitle.topAnchor.constraint(equalTo: usernameImage.bottomAnchor, constant: 10),
            textFieldBottomTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textFieldBottomTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    
//    private func setupBodyLabel() {
//        addSubview(lblBody)
//
//        lblBody.numberOfLines = 3
//        lblBody.font = RobotoFont.medium.size(12)
//        lblBody.textColor = .black
//
//        NSLayoutConstraint.activate([
//            lblBody.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 10),
//            lblBody.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            lblBody.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
//        ])
//    }
    
    private func setupAvatarImageView() {
        addSubview(ivAvatarImage)
    
        ivAvatarImage.image = UIImage(named: "ImagePlaceholder")
        
        NSLayoutConstraint.activate([
            ivAvatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 120),
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
            uploadImage.bottomAnchor.constraint(equalTo: ivAvatarImage.centerYAnchor, constant: 65),
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
            mailImage.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 200),
            mailImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            mailImage.heightAnchor.constraint(equalToConstant: 16),
            mailImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    private func editMailImageView() {
        addSubview(editEmailImage)
    
        editEmailImage.image = UIImage(named: "editIcon")
        editEmailImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // uploadImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 20),
//            mailImage.centerXAnchor.constraint(equalTo: tfEmail.centerXAnchor),
         //   mailImage.trailingAnchor.constraint(equalTo: tfEmail.leadingAnchor),
            editEmailImage.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 200),
            editEmailImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            editEmailImage.heightAnchor.constraint(equalToConstant: 16),
            editEmailImage.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
    private func editusernameImageView() {
        addSubview(editNameImage)
    
        editNameImage.image = UIImage(named: "editIcon")
        editNameImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // uploadImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 20),
//            mailImage.centerXAnchor.constraint(equalTo: tfEmail.centerXAnchor),
         //   mailImage.trailingAnchor.constraint(equalTo: tfEmail.leadingAnchor),
            editNameImage.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 30),
            editNameImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            editNameImage.heightAnchor.constraint(equalToConstant: 16),
            editNameImage.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
    private func setupPhoneImageView() {
        addSubview(phoneImage)
    
        phoneImage.image = UIImage(named: "phone")
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // uploadImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 20),
//            mailImage.centerXAnchor.constraint(equalTo: tfEmail.centerXAnchor),
         //   mailImage.trailingAnchor.constraint(equalTo: tfEmail.leadingAnchor),
            phoneImage.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 115),
            phoneImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            phoneImage.heightAnchor.constraint(equalToConstant: 16),
            phoneImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    private func setupUsernameImageView() {
        addSubview(usernameImage)
    
        usernameImage.image = UIImage(named: "username")
        usernameImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           // uploadImage.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 20),
           // usernameImage.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  20),
            usernameImage.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 30),
         //   usernameImage.trailingAnchor.constraint(equalTo: textFieldStack.leadingAnchor),
            usernameImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            usernameImage.heightAnchor.constraint(equalToConstant: 20),
            usernameImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    
    private func setupActionButton() {
//        addSubview(actionButton)
//
//        NSLayoutConstraint.activate([
//            actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding),
//            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
//            actionButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
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
//    private func setupEmailTextField() {
//
//        contentView.addSubview(tfEmail)
//        scrollView.backgroundColor = .clear
//
//        NSLayoutConstraint.activate([
//            tfEmail.topAnchor.constraint(equalTo: textFieldStack.topAnchor, constant: 60),
//            tfEmail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
//            tfEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            tfEmail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: ivAvatarImage.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
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
        tfuserName.textField.text = "Rizwan Rana"
        tfEmail.textField.text = "Rizwan.sultan@confu"
        tfPhone.textField.text = "+923006088886"
        setupHeaderView()
        
      //  setupBodyLabel()
        setupAvatarImageView()
        setupActionButton()
        setupScrollView()
        setupContentView()
        setupTextFieldStack()
        
      //  setupEmailTextField()
        setupUploadImageView()
        setupMailImageView()
        setupUsernameImageView()
        setupPhoneImageView()
        setupLargeTitleLabel()
        editMailImageView()
        editusernameImageView()
    }
}
