//
//  ProfileImagePresenting.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 08/07/2021.
//


import UIKit

protocol ProfileImagePresenting {
    
    // This is fired when the user picks or captures a profile image
    func picked(image: UIImage)
}
