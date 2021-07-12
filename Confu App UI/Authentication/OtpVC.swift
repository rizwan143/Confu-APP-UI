//
//  OtpVC.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit
import Combine

class OtpVC: UIViewController, UIGestureRecognizerDelegate {
    private var otpView = OTPView()
    
    var userPhoneNumber: String!
    var verificationID: String!
    
//    var otpVM: OtpVM!
//    var firebaseFunction: FirebaseCloudFunctions/
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var cancellables = Set<AnyCancellable>()
    
    var tap: UITapGestureRecognizer! {
        UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    }
    
//    init(firebaseFunction: FirebaseCloudFunctions = FirebaseCloudFunctions()) {
//        self.firebaseFunction = firebaseFunction
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        super.loadView()
        otpView.otpVC = self
        view = otpView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setKeyboarObserver()
      //  otpVM.startTimer()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        otpVM = OtpVM(firebaseFunciton: firebaseFunction)
//
//        configureNavigationBar(backgroundColor: UIColor().backgroundColor, tintColor: UIColor().titleColor)
//
        otpView.otpTextField.delegate = self
        otpView.lblPhoneNumber.text = userPhoneNumber
        
//        hideKeyboard()
//        setupListener()
//
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
    @objc func backPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func actionButtonTapped() {
        let createProfileViewController = CreateProfileVC()
            navigationController?.pushViewController(createProfileViewController, animated: true)
//                let tabBarController =  TabbarController()
//                appDelegate.window?.rootViewController = tabBarController

      //  otpVM.verifyOtp(with: verificationID, and: otpView.otpTextField.getOTP())
    }
    
    @objc func btnResendCode() {
        otpView.otpTextField.resignFirstResponder()
      //  otpVM.resendCode(phoneNumber: userPhoneNumber)
    }
}


extension OtpVC {
    

    func setKeyboarObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            otpView.buttonBottomConstraint.isActive = false
            UIView.animate(withDuration: 0.3, animations: {
                
                self.otpView.buttonBottomConstraint = self.otpView.btnContinue.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -keyboardSize.height - 20)
                NSLayoutConstraint.activate([
                    self.otpView.buttonBottomConstraint
                ])
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        otpView.buttonBottomConstraint.isActive = false
        UIView.animate(withDuration: 0.3, animations: {
            
            self.otpView.buttonBottomConstraint = self.otpView.btnContinue.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            NSLayoutConstraint.activate([
                self.otpView.buttonBottomConstraint
            ])
            self.view.layoutIfNeeded()
        })
    }
}

extension OtpVC: OTPDelegate {
    func didChangeValidity(isValid: Bool) {
        print("IS VALID: \(isValid)")
    }
}


//extension OtpVC: KeyboardProtocol {
//    func hideKeyboard() {
//        keyboardHideOnDissmiss()
//    }
    
//}
