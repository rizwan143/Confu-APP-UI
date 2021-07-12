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
    var userImagePath: String!
 
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
    

}
