//
//  FontSizes.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 10/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

struct FontSizes {
    static let primary: CGFloat = 40.0
    static let secondary: CGFloat = 16.0
    static let textFieldPrimary: CGFloat = 19.0
    static let bulletPrimary: CGFloat = 17.0
    static let labelPrimary: CGFloat = 18.0
    static let labelLarge: CGFloat = 22.0
    static let labelSmall: CGFloat = 14.0
    static let labelSmallest: CGFloat = 12.0
    static let navbarPrimary: CGFloat = 21.0
    static let cellPrimary: CGFloat = 23.0
}

enum Sizes: CGFloat {
    case primary = 40.0
    case secondary = 16.0
    
    var size: CGFloat {
        switch self {
        case .primary:
            return 40.0
        case .secondary:
            return 16.0
        }
    }
}
