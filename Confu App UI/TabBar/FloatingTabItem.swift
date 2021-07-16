//
//  FloatingTabItem.swift
//  ProgrammaticUI
//
//  Created by Shayan on 10/06/2021.
//

import UIKit

open class FloatingTabItem: NSObject {
    
    static let empty = FloatingTabItem(image: UIImage())
    
    // Recommended size 35x35pt
    public var selectedImage: UIImage
    // Recommended size 25x25pt
    public var normalImage: UIImage
    
    public init(selectedImage: UIImage, normalImage: UIImage) {
        self.selectedImage = selectedImage
        self.normalImage = normalImage
    }
    
    public init(image: UIImage) {
        self.selectedImage = image
        self.normalImage = image
    }
}
