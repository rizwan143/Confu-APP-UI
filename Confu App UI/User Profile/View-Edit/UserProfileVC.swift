//
//  UserProfileVC.swift
//  ConfuNewDesign
//
//  Created by Shayan on 02/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController, UIGestureRecognizerDelegate {
  
    
    let userProfileView = UserProfileView()

  //  var updateUserProfileVM: UpdateUserProfileVM!


    var dataSource = UserProfileDataSource()
    var imagePickerController = UIImagePickerController()
    
    var profileImagePickerDelegate = ProfileImagePickerDelegate()

    var user = [String: Any]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
  //  var localUser: LocalUser?
    var selectedImage : UIImage?
    var tap: UITapGestureRecognizer! {
        UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    }

    override func loadView() {
        super.loadView()

        view = userProfileView
        userProfileView.userProfileVC = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedImage != nil
        {
            userProfileView.ivAvatarImage.image = selectedImage
        }
       
  //     configureNavigationBar(backgroundColor: UIColor().backgroundColor, tintColor: UIColor().titleColor)
        
//        hideKeyboard()
//
//
//        setKeyboarObserver()
//
//        presentUserDetails()

     //   updateUserProfileVM = UpdateUserProfileVM()

    //    updateUserProfileVM.getLocalUser(user)
//        dataSource.delegate = self
        profileImagePickerDelegate.parentController = self
    //    setupListener()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
       // removeKeyboardObserver()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)

        hidesBottomBarWhenPushed = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    func presentUserDetails() {
//        setImage()
//        userProfileView.usernameLabel.text = localUser?.name
//        userProfileView.phoneNumberLabel.text = localUser?.number
//        userProfileView.usernameTextField.textField.text = localUser?.name
//        userProfileView.designationTextField.textField.text = localUser?.designation
//        userProfileView.departmentTextField.textField.text = localUser?.department
//        userProfileView.companyTextField.textField.text = localUser?.company
//        userProfileView.aboutTextField.textField.text = localUser?.status
//    }

    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
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
    
    

    @objc func actionButtonTapped() {
//        let tabBarController =  TabbarController()
//        appDelegate.window?.rootViewController = tabBarController

//        let validate = dataSource.validateTextFields(from: userProfileView)
//        if  validate.success {
//            print(validate.success)
//            isImageSelected ? dataSource.uploadUser(from: userProfileView) : dataSource.uploadUserDetails()
//        }
//        else {
//            self.createAlert(title: "Error", message: validate.message)
//        }
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            userProfileView.buttonBottomConstraint.isActive = false
            UIView.animate(withDuration: 0.3, animations: {

//                self.userProfileView.buttonBottomConstraint = self.userProfileView.actionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -keyboardSize.height - 20)
                NSLayoutConstraint.activate([
                    self.userProfileView.buttonBottomConstraint
                ])
                self.view.layoutIfNeeded()
            })
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        userProfileView.buttonBottomConstraint.isActive = false
        UIView.animate(withDuration: 0.3, animations: {

//            self.userProfileView.buttonBottomConstraint = self.userProfileView.actionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            NSLayoutConstraint.activate([
                self.userProfileView.buttonBottomConstraint
            ])
            self.view.layoutIfNeeded()
        })
    }


}


extension UserProfileVC {
//
//    func setupListener() {
//        updateUserProfileVM.localUser.bind { [weak self] in
//            guard let `self` = self else {
//                return
//            }
//            guard let localUser = $0 else {
//                return
//            }
//            `self`.localUser = localUser
//            `self`.presentUserDetails()
//        }
//
//        updateUserProfileVM.isLoading.bind {
//            $0 ? Loader.startLoading() : Loader.stopLoading()
//        }
//    }
//
//
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
//
//    func setKeyboarObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//
//    }
//
//    func removeKeyboardObserver() {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    func setImage() {
//        let item = UserModel.fromDictionary(user)
//        userProfileView.avatarImageView.downloadImage(of: item)
//    }
}

extension UserProfileVC: ProfileImagePresenting {
    func picked(image: UIImage) {
        userProfileView.ivAvatarImage.image = image
    }
}
//
//extension UserProfileVC: KeyboardProtocol {
//    func hideKeyboard() {
//        keyboardHideOnDissmiss()
//    }
//}
