//
//  UserVC.swift
//  Confu
//
//  Created by Waleed Khan on 14/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class UserVC: UIViewController {

    let userView = UserView()
    
    override func loadView() {
        super.loadView()
        view = userView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
