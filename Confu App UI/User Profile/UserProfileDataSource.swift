//
//  UserProfileDataSource.swift
//  Confu
//
//  Created by Shayan on 21/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import Foundation

class UserProfileDataSource: NSObject {
    weak var delegate: CreateProfileVC?
    
    let userDefaults = UserDefaults.standard
//    var cloudFunctionsManager = FirebaseCloudFunctions()
//    var cloudStorageManager = CloudStorageManager()
//    var contactsManager = ContactsManager()
//
    var userImagePath: String!
    
  //  var user: LocalUser?
  //  let myUser = UserDefaults.standard.getUser
    
   // var persistenceManager = PersistenceManager.shared
    
//    func processUserDetails(from view: CreateProfileView) -> LocalUser {
//
//        return LocalUser(
//            uuid: delegate?.userPhoneNumber.sha1.hexString ?? "",
//            name: view.tfUsername.textField.text ?? "",
//            number: delegate?.userPhoneNumber ?? "",
//            designation: view.tfDesignation.textField.text ?? "",
//            department: view.tfDepartment.textField.text ?? "",
//            company: view.tfCompany.textField.text ?? "",
//            status: view.tfAbout.textField.text ?? "",
//            picture: userImagePath ?? "",
//            fcm: delegate?.fcmToken ?? "",
//            voipToken: UserDefaults.standard.string(forKey: UserDefaultKey.USER_VOIP_TOKEN) ?? "",
//            platform: "ios",
//            isOnline: ""
//        )
//    }
    
    func validateTextFields(from view: CreateProfileView) -> (success: Bool, message: String) {
        guard view.tfFirstname.textField.text?.count ?? 0 > 0 else {
           return (false, "Name field cannot be empty.")
            
        }
        guard  delegate?.userPhoneNumber?.count ?? 0 > 0 else {
            return (false, "Could not get phone number.")
        }
        guard let _ = UserDefaults.standard.string(forKey: UserDefaultKey.USER_VOIP_TOKEN) else {
            return (false, "Voip token is empty.")
        }
        
       // self.user = self.processUserDetails(from: view)
        return (true, "Success")
    }
    
//    func uploadWithImage(from view: CreateProfileView) {
//        cloudStorageManager.uploadImage(with: delegate?.userPhoneNumber.sha1.hexString ?? "", image: view.ivAvatarImage.image) { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case .success(let path):
//                self.userImagePath = path
//                self.user = self.processUserDetails(from: view)
//                self.uploadWithoutImage()
//            case .failure(let error):
//                fatalError(error.rawValue)
//            }
//        }
//    }
    
//    func uploadWithoutImage() {
//        userDefaults.persist(user!)
//        self.cloudFunctionsManager.register(user: user!) { result in
//            switch result {
//            case .success(_):
//                self.userDefaults.set(true, forKey: UserDefaultKey.IS_USER_AUTHENTICATED)
//                self.processLocalContacts()
//                self.delegate?.finishedUploadingUser()
//            case .failure(let error):
//                fatalError("\(error.rawValue)")
//            }
//
//            Loader.stopLoading()
//        }
//    }
    
//    private func processLocalContacts() {
////        let myUUID = myUser["uuid"] as! String
//        
//        contactsManager.requestContactsAccess { [weak self] success in
//            guard let self = self else { return }
//            
//            if success {
//                let allContacts = self.contactsManager.getEncryptedContactNumbers()
//                self.cloudFunctionsManager.matchRegisteredUsers(from: allContacts) { result in
//                    
//                    switch result {
//                    case .success(let users):
//                        
//                        users.forEach {
//                            if self.user?.uuid != $0.uuid {
//                                print("MY USER UUID: \(self.user?.uuid), CLOUD USER UUID: \($0.uuid)")
//                                let _ = $0.persistUser($0.name)
//                            }
//                        }
//                    case .failure(let error):
//                        fatalError(error.rawValue)
//                    }
//                }
//            }
//        }
//    }
}
