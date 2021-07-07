//
//  OTPView.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class OTPView: UIView {
    var otpVC: OtpVC? {
        didSet {
            let backItem = UIBarButtonItem(image: UIImage(named: "navBack"), style: .plain, target: otpVC, action: #selector(OtpVC.backPressed))
            otpVC?.navigationItem.leftBarButtonItem = backItem
            
            otpVC?.navigationController?.interactivePopGestureRecognizer?.delegate = otpVC
            
            btnContinue.addTarget(otpVC, action: #selector(OtpVC.actionButtonTapped), for: .touchUpInside)
            btnResendCode.addTarget(otpVC, action: #selector(OtpVC.btnResendCode), for: .touchUpInside)
        }
    }
    
    let lblLargeTitle = CFLargeTitleLabel(text: StaticLabels.vpNumberViewLargeText.rawValue, textColor: .black)
    
    let lblBody = CFBodyLabel(text: StaticLabels.vpNumberViewBodyText.rawValue)
    let lblPhoneNumber = CFTitleLabel(fontSize: 13, textColor: .black)
    let btnResendCode = UIButton()
    
    let otpTextField = CFOtpStack()
    
    let btnContinue = CFPrimaryButton(title: "Continue", backgroundColor: .white, titleColor: .black)
    
    let padding: CGFloat = 20
    let secondaryPadding: CGFloat = 40
    
    var buttonBottomConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
            //UIColor().backgroundColor
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLargeTitleLabel() {
        addSubview(lblLargeTitle)
        
        lblLargeTitle.numberOfLines = 2
        lblLargeTitle.textAlignment = .center
        NSLayoutConstraint.activate([
            lblLargeTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            lblLargeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            lblLargeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupBodyLabel() {
        addSubview(lblBody)
        
        lblBody.textColor = .black
            //UIColor().titleColor
        lblBody.textAlignment = .center
        lblBody.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            lblBody.topAnchor.constraint(equalTo: lblLargeTitle.bottomAnchor, constant: 10),
            lblBody.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            lblBody.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func setupPhoneNumber() {
        addSubview(lblPhoneNumber)
        lblPhoneNumber.text = ""
        
        lblPhoneNumber.font = RobotoFont.bold.size(12)
        
        NSLayoutConstraint.activate([
            lblPhoneNumber.topAnchor.constraint(equalTo: lblBody.bottomAnchor, constant: 10),
            lblPhoneNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            lblPhoneNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding)
        ])
    }
    
    private func setupOTPTextField() {
        addSubview(otpTextField)
        
        NSLayoutConstraint.activate([
            otpTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            otpTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: secondaryPadding),
            otpTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -secondaryPadding),
            otpTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupAboveOTPTitle() {
        addSubview(btnResendCode)
        btnResendCode.translatesAutoresizingMaskIntoConstraints = false
        
        btnResendCode.setTitle("", for: .normal)
        btnResendCode.setTitleColor(.black, for: .normal)
        //UIColor().primary
        btnResendCode.setTitleColor(.black, for: .disabled)
        //UIColor().subTitleColor
        btnResendCode.titleLabel?.font = RobotoFont.medium.size(13)
        
        NSLayoutConstraint.activate([
            btnResendCode.bottomAnchor.constraint(equalTo: otpTextField.topAnchor, constant: -padding),
            btnResendCode.trailingAnchor.constraint(equalTo: otpTextField.trailingAnchor)
        ])
    }
    
    private func setupActionButton() {
        addSubview(btnContinue)
        
        buttonBottomConstraint = btnContinue.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        
        NSLayoutConstraint.activate([
            buttonBottomConstraint,
            btnContinue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: secondaryPadding),
            btnContinue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -secondaryPadding),
            btnContinue.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupScreen() {
        setupLargeTitleLabel()
        setupBodyLabel()
        setupPhoneNumber()
        setupOTPTextField()
        setupAboveOTPTitle()
        setupActionButton()
    }
}
