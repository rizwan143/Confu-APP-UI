//
//  UserDefaultsManager.swift
//  AUTest
//
//  Created by Confu Application on 29/11/2019.
//  Copyright © 2019 Shayan Zahid. All rights reserved.
//

import Foundation

enum UserDefaultKey {
    static let IS_USER_AUTHENTICATED = "com.isUserAuthenticated.confu"
    static let SERVER_IP = "com.serverIPAddress.confu"
    static let LOCAL_MEMBER = "com.localMember.confu"
    static let USER_UUID = "com.userUUID.confu"
    static let USER_VOIP_TOKEN = "com.voipToken.confu"
    
    static let CALL_IDENTIFICATION = "com.callIdentification.confu"
    static let NTS_DATA = "com.ntsKeyIdentification.confu"
}
