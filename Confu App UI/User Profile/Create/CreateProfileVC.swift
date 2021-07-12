//
//  CreateProfileVC.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CreateProfileVC: UIViewController, UIGestureRecognizerDelegate {
 
    
    private var createProfileView = CreateProfileView()
    
    var userPhoneNumber: String!
    var fcmToken: String!
    var voipToken: String!
    
    var userImagePath: String?
    
    var profileImagePickerDelegate = ProfileImagePickerDelegate()
    var imagePickerController = UIImagePickerController()
    
    var dataSource = UserProfileDataSource()
    var selectedImage : UIImage?
    private var isImageSelected: Bool!
    var tap: UITapGestureRecognizer! {
        UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    }
    
//    init(firebaseFuntion: FirebaseCloudFunctions = FirebaseCloudFunctions()) {
//        self.firebaseFunction = firebaseFuntion
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    override func loadView() {
        super.loadView()
        
        createProfileView.createProfileVC = self
        view = createProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hideKeyboard()
//        createProfileVM = CreateProfileVM(phoneNumber: userPhoneNumber)
        isImageSelected = false
        
//        remoteNotifications.getFCMToken { token in
//            self.fcmToken = token
//        }
        
        print("LOCAL USER VOIP TOKEN: \(UserDefaults.standard.string(forKey: UserDefaultKey.USER_VOIP_TOKEN))")
        
        profileImagePickerDelegate.parentController = self
        dataSource.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        setKeyboarObserver()
    }
    
    func finishedUploadingUser() {
       // Loader.stopLoading()
        navigationController?.pushViewController(BestPracticesVC(), animated: true)
    }
    
    @objc func actionButtonTapped() {
        let userProfileViewController = UserProfileVC()
        userProfileViewController.selectedImage = self.selectedImage
        userProfileViewController.navigationController?.isNavigationBarHidden = false
            navigationController?.pushViewController(userProfileViewController, animated: true)

    }
    
    @objc func selectProfileImage() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let takePhotoAction = UIAlertAction(title: "Take photo", style: .default, handler: selectPhoto)
        let choosePhotoAction = UIAlertAction(title: "Choose photo", style: .default, handler: selectPhoto)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(takePhotoAction)
        actionSheet.addAction(choosePhotoAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true)
    }
    
    private func selectPhoto(action: UIAlertAction) {
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = profileImagePickerDelegate
        
        switch action.title! {
        case "Take photo":
            imagePickerController.sourceType = .camera
        case "Choose photo":
            imagePickerController.sourceType = .photoLibrary
        default:
            print("No photo source")
        }
        
        present(imagePickerController, animated: true)
    }
}

extension CreateProfileVC {
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
            createProfileView.buttonBottomConstraint.isActive = false
            UIView.animate(withDuration: 0.3, animations: {
                
                self.createProfileView.buttonBottomConstraint = self.createProfileView.actionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -keyboardSize.height - 20)
                NSLayoutConstraint.activate([
                    self.createProfileView.buttonBottomConstraint
                ])
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        createProfileView.buttonBottomConstraint.isActive = false
        UIView.animate(withDuration: 0.3, animations: {
            
            self.createProfileView.buttonBottomConstraint = self.createProfileView.actionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            NSLayoutConstraint.activate([
                self.createProfileView.buttonBottomConstraint
            ])
            self.view.layoutIfNeeded()
        })
    }
}


extension CreateProfileVC: ProfileImagePresenting {
    func picked(image: UIImage) {
        createProfileView.ivAvatarImage.image = image
        self.selectedImage = image
        isImageSelected = true
        createProfileView.uploadImage.isHidden = true
    }
}
//
//extension CreateProfileVC: KeyboardProtocol {
//    func hideKeyboard() {
//        keyboardHideOnDissmiss()
//    }
//
//}
