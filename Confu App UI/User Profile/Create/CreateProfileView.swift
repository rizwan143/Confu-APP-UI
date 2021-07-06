////
////  CreateProfileView.swift
////  ConfuNewDesign
////
////  Created by Shayan Zahid on 11/02/2020.
////  Copyright © 2020 Shayan Zahid. All rights reserved.
////
//
//import UIKit
//
//class CreateProfileView: UIView {
//    var createProfileVC: CreateProfileVC? {
//        didSet {
//            let backItem = UIBarButtonItem(image: UIImage(named: "navBack"), style: .plain, target: createProfileVC, action: #selector(OtpVC.backPressed))
//            createProfileVC?.navigationItem.leftBarButtonItem = backItem
//            
//            createProfileVC?.navigationController?.interactivePopGestureRecognizer?.delegate = createProfileVC
//            
//            ivAvatarImage.addGestureRecognizer(UITapGestureRecognizer(target: createProfileVC, action: #selector(CreateProfileVC.selectProfileImage)))
//            ivAvatarImage.isUserInteractionEnabled = true
//            
//            actionButton.addTarget(createProfileVC, action: #selector(CreateProfileVC.actionButtonTapped), for: .touchUpInside)
//        }
//    }
//
//    var uvHeader = UIView()
//    
//    let lblLargeTitle = CFBodyLabel(text: StaticLabels.cpViewLargeText.rawValue)
//    let lblBody = CFBodyLabel(text: StaticLabels.cpViewBodyText.rawValue)
//    
//    let ivAvatarImage = CFAvatarImageView(frame: .zero)
//    
//    var tfUsername = CFFloatingTextField("User name")
//    var tfDesignation = CFFloatingTextField("Designation")
//    var tfDepartment = CFFloatingTextField("Department")
//    var tfCompany = CFFloatingTextField("Company")
//    var tfAbout = CFFloatingTextField("About Me")
//    
//    lazy var textFieldStack = CFStackView(views: [
//        tfUsername,
//        tfDesignation,
//        tfDepartment,
//        tfCompany,
//        tfAbout
//    ], axis: .vertical, spacing: 10)
//    
//    
//    let scrollView = UIScrollView()
//    let contentView = UIView()
//    
//    
//    var buttonBottomConstraint = NSLayoutConstraint()
//    
//    let actionButton = CFPrimaryButton(title: "Save", backgroundColor: UIColor().primary, titleColor: .white)
//    
//    let padding: CGFloat = 20
//    let secondaryPadding: CGFloat = 40
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
//    private func setupHeaderView() {
//        addSubview(uvHeader)
//        
//        uvHeader.backgroundColor = UIColor().backgroundColor
//        
//        uvHeader.translatesAutoresizingMaskIntoConstraints = false
//        
//        uvHeader.layer.shadowColor = UIColor.lightGray.cgColor
//        uvHeader.layer.shadowOpacity = 0.3
//        uvHeader.layer.shadowOffset = CGSize(width: 2, height: 2)
//        uvHeader.layer.shadowRadius = 10
//        
//        NSLayoutConstraint.activate([
//            uvHeader.topAnchor.constraint(equalTo: topAnchor),
//            uvHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
//            uvHeader.trailingAnchor.constraint(equalTo: trailingAnchor)
//            
//        ])
//    }
//    
//    private func setupLargeTitleLabel() {
//        addSubview(lblLargeTitle)
//        
//        lblLargeTitle.font = RobotoFont.black.size(24)
//        lblLargeTitle.textColor = UIColor().titleColor
//        lblLargeTitle.numberOfLines = 1
//        
//        NSLayoutConstraint.activate([
//            lblLargeTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
//            lblLargeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            lblLargeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
//        ])
//    }
//    
//    private func setupBodyLabel() {
//        addSubview(lblBody)
//        
//        lblBody.numberOfLines = 3
//        lblBody.font = RobotoFont.medium.size(12)
//        lblBody.textColor = UIColor().titleColor
//        
//        NSLayoutConstraint.activate([
//            lblBody.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 10),
//            lblBody.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            lblBody.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
//        ])
//    }
//    
//    private func setupAvatarImageView() {
//        addSubview(ivAvatarImage)
//    
//        ivAvatarImage.image = UIImage(named: "ImagePlaceholder")
//        
//        NSLayoutConstraint.activate([
//            ivAvatarImage.topAnchor.constraint(equalTo: lblBody.bottomAnchor, constant: 20),
//            ivAvatarImage.centerXAnchor.constraint(equalTo: uvHeader.centerXAnchor),
//            ivAvatarImage.bottomAnchor.constraint(equalTo: uvHeader.bottomAnchor, constant: 40),
//            ivAvatarImage.heightAnchor.constraint(equalToConstant: 80),
//            ivAvatarImage.widthAnchor.constraint(equalToConstant: 80)
//        ])
//    }
//    
//    private func setupActionButton() {
//        addSubview(actionButton)
//        
//        NSLayoutConstraint.activate([
//            actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding),
//            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
//            actionButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//
//    private func setupTextFieldStack() {
//        
//        contentView.addSubview(textFieldStack)
//        scrollView.backgroundColor = .clear
//        
//        NSLayoutConstraint.activate([
//            textFieldStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            textFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            textFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
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
//            scrollView.topAnchor.constraint(equalTo: ivAvatarImage.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20)
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
//    
//    private func setupScreen() {
//        setupHeaderView()
//        setupLargeTitleLabel()
//        setupBodyLabel()
//        setupAvatarImageView()
//        setupActionButton()
//        setupScrollView()
//        setupContentView()
//        setupTextFieldStack()
//    }
//}
