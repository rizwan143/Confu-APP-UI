//
//  UpdateProfileDataSource.swift
//  Confu
//
//  Created by Waleed Khan on 20/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import Foundation

//class UpdateProfileDataSource: NSObject {
//    weak var delegate: UserProfileVC?
//    
//    let userDefaults = UserDefaults.standard
//    var cloudFunctionsManager = FirebaseCloudFunctions()
//    var cloudStorageManager = CloudStorageManager()
//    var contactsManager = ContactsManager()
//    
//    var userImagePath: String!
//    
//    var user: LocalUser?
//    
//    var persistenceManager = PersistenceManager.shared
//    
//    func validateTextFields(from view: CreateProfileView) -> (success: Bool,message: String){
//        guard view.tfUsername.textField.text?.count ?? 0 > 0 else {
//            return (false,"Name field cannot be empty.")
//            
//        }
//        guard let _ = UserDefaults.standard.string(forKey: UserDefaultKey.USER_VOIP_TOKEN) else {
//            return (false,"Voip token is empty.")
//        }
//        
//        return (true,"Success")
//    }
//    
//    func uploadUser(from view: CreateProfileView) {
//        Loader.startLoading()
//        
////        cloudStorageManager.uploadImage(with: delegate?.userPhoneNumber.sha1.hexString ?? "", image: view.avatarImageView.image) { [weak self] result in
////            guard let self = self else { return }
////
////            switch result {
////            case .success(let path):
////                self.userImagePath = path
////                self.uploadUserDetails()
////            case .failure(let error):
////                fatalError(error.rawValue)
////            }
////        }
//    }
//    
//    func uploadUserDetails() {
//        userDefaults.persist(user!)
//        self.cloudFunctionsManager.register(user: user!) { result in
//            switch result {
//            case .success(_):
//                self.userDefaults.set(true, forKey: UserDefaultKey.IS_USER_AUTHENTICATED)
//            case .failure(let error):
//                fatalError("\(error.rawValue)")
//            }
//        }
//    }
//}
