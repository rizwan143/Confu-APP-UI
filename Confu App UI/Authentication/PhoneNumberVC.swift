//
//  PhoneNumberVC.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 10/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit
//import FlagPhoneNumber
//import FirebaseAuth
import Combine

 class PhoneNumberVC: UIViewController {
    private var phoneNumberView = PhoneNumberView()

//    let countryListController = FPNCountryListViewController(style: .grouped)

    private var cancellables = Set<AnyCancellable>()

    var isIDReceived = false
    var verificationID: String?
    var isPhoneNumberValid = false
    var formattedPhoneNumber: String?


    var tap: UITapGestureRecognizer! {
        UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    }

//    private var phoneNumberVM: PhoneNumberVM!
//    private var firebaseFunctions: FirebaseCloudFunctions!
//
//    init(firebaseFunctions: FirebaseCloudFunctions) {
//        super.init(nibName: nil, bundle: nil)
//        self.firebaseFunctions = firebaseFunctions
//
//        hidesBottomBarWhenPushed = true
//    }

    override func loadView() {
        super.loadView()
        phoneNumberView.phoneNumberVC = self
        view = phoneNumberView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setKeyboarObserver()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        countryPicker()
   //     self.phoneNumberVM = PhoneNumberVM(firebaseFunction: firebaseFunctions)
//        hideKeyboard()
//        phoneNumberView.tfPhoneNumber.delegate = self
////        phoneNumberView.tfPhoneNumber.displayMode = .list
//        setupListener()
    }

    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    @objc func actionButtonTapped() {
        let otpViewController = OtpVC()
            navigationController?.pushViewController(otpViewController, animated: true)
//        if isPhoneNumberValid {
//            self.phoneNumberView.tfPhoneNumber.resignFirstResponder()
//            phoneNumberVM.signUp()
//        } else {
//            self.createAlert(title: "Error", message: .invalidPhoneNumber)
//        }

     //   phoneNumberView.tfPhoneNumber.resignFirstResponder()
     //   phoneNumberVM.signUp()
    }
}

extension PhoneNumberVC {
    
//    func setupListener() {
//
//        phoneNumberVM.$isLoading.sink {
//            $0 ? Loader.startLoading() : Loader.stopLoading()
//        }.store(in: &cancellables)
//
//        phoneNumberVM.$error.sink { [weak self] in
//            guard let self = self,
//                  let error = $0 else {
//                return
//            }
//
//            self.createAlert(title: "Error", message: error)
//        }.store(in: &cancellables)
//
//        phoneNumberVM.$verificationID.sink { [weak self] in
//            guard let self = self,
//                  let verificationID = $0 else {
//                return
//            }
//
//            let otpVC = OtpVC()
//            self.verificationID = verificationID
//            otpVC.userPhoneNumber = self.formattedPhoneNumber!
//            otpVC.verificationID = verificationID
//
//            self.navigationController?.pushViewController(otpVC, animated: true)
//        }.store(in: &cancellables)
//
//        phoneNumberVM.$phoneNumber.sink { [weak self] in
//            guard let self = self else { return }
//            self.formattedPhoneNumber = $0
//            self.phoneNumberView.tfPhoneNumber.text = $0
//        }.store(in: &cancellables)
//    }
    
//    func countryPicker() {
//        countryListController.setup(repository: phoneNumberView.tfPhoneNumber.countryRepository)
//        countryListController.didSelect = { [weak self] country in
//            self?.phoneNumberView.tfPhoneNumber.setFlag(countryCode: country.code)
//        }
//    }
    
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
            phoneNumberView.buttonBottomConstraint.isActive = false
            UIView.animate(withDuration: 0.3, animations: {
                
                self.phoneNumberView.buttonBottomConstraint = self.phoneNumberView.actionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -keyboardSize.height - 20)
                NSLayoutConstraint.activate([
                    self.phoneNumberView.buttonBottomConstraint
                ])
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        phoneNumberView.buttonBottomConstraint.isActive = false
        UIView.animate(withDuration: 0.3, animations: {
            
            self.phoneNumberView.buttonBottomConstraint = self.phoneNumberView.actionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            NSLayoutConstraint.activate([
                self.phoneNumberView.buttonBottomConstraint
            ])
            self.view.layoutIfNeeded()
        })
    }
}


//extension PhoneNumberVC: FPNTextFieldDelegate {
//    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
//        print(name, dialCode, code)
//    }
//
//    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
//        if isValid {
//            isPhoneNumberValid = isValid
//            formattedPhoneNumber = textField.getFormattedPhoneNumber(format: .E164)!
//        } else {
//            isPhoneNumberValid = isValid
//        }
//    }
//
//    func fpnDisplayCountryList() {
//        let vc = UINavigationController(rootViewController: countryListController)
//        countryListController.title = "Countries"
//        present(vc, animated: true)
//    }
//}


//extension PhoneNumberVC: KeyboardProtocol {
//    func hideKeyboard() {
//        keyboardHideOnDissmiss()
//    }
//
//}
//
//extension PhoneNumberVC: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard let text = textField.text else { return false }
//
//        switch textField {
//            case phoneNumberView.tfPhoneNumber:
//                phoneNumberVM.checkAndUpdatePhoneNumber(text: text, newCharacter: string, range: range)
//            default:
//                break
//        }
//
//        return false
//    }
//}
