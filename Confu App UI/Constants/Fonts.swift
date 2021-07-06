//
//  Fonts.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 10/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum FontSize: CGFloat {
    case textForty = 40.0
    case textThirty = 30.0
    case textTwentyThree = 23.0
    case textTwentyTwo = 22.0
    case textTwentyOne = 21.0
    case textNinteen = 19.0
    case textEighteen = 18.0
    case textSeventeen = 17.0
    case textSixteen = 16.0
    case textFourteen = 14.0
    case textTwelve = 12.0
}

enum PoppinsFont: String {
    case regular = "Regular"
    case bold = "Bold"
    case thin = "Thin"
    case medium = "Medium"
    
    private var name: String {
        return "Poppins-\(rawValue)"
    }
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: name, size: size) {
            return UIFontMetrics.default.scaledFont(for: font)
        }
        
        fatalError("There is no font named: \(name)")
    }
}


enum RobotoFont: String {
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case thin = "Thin"
    case thinItalic = "ThinItalic"
    
    private var name: String {
        return "Roboto-\(rawValue)"
    }
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: name, size: size) {
            return UIFontMetrics.default.scaledFont(for: font)
        }
        
        fatalError("There is no font named: \(name)")
    }
}

enum LatoFont: String {
    case regular = "Regular"
    
    case black = "Black"
    
    case bold = "Bold"
    
    case semiBold = "Semibold"
    
    case medium = "Medium"
    
    // A computed property which returns the Font Family Name
    private var name: String {
        return "Lato-\(rawValue)"
    }
    
    // A function which returns the scaled font for the specified font name and size
    func size(_ size: FontSize) -> UIFont {
        if let font = UIFont(name: name, size: size.rawValue) {
            return UIFontMetrics.default.scaledFont(for: font)
        }
        fatalError("There is no font named: \(name)")
    }
}

enum FontBook {
    case mainHeadline
    
    case subHeadline
    
    case bodyBold
    
    case bodySemibold
    
    case bodyRegular
    
    case paragraph
    
    case heading
    
    case subHeading
    
    case smallHeading
    
    case titleBold
    
    case titleMedium
    
    case titleRegular
    
    case titleRegularSmall
    
    case titleMediumSmall
    
    case titleMediumSmallest
    
    case navbarMedium
    
    var font: UIFont {
        switch self {
        case .mainHeadline:
            return LatoFont.black.size(.textForty)
        case .subHeadline:
            return LatoFont.regular.size(.textSixteen)
        case .bodyBold:
            return LatoFont.bold.size(.textTwentyTwo)
        case .bodySemibold:
            return LatoFont.semiBold.size(.textTwentyTwo)
        case .bodyRegular:
            return LatoFont.regular.size(.textTwentyTwo)
        case .paragraph:
            return LatoFont.regular.size(.textSixteen)
        case .heading:
            return LatoFont.regular.size(.textNinteen)
        case .subHeading:
            return LatoFont.semiBold.size(.textSeventeen)
        case .smallHeading:
            return LatoFont.regular.size(.textFourteen)
        case .titleBold:
            return LatoFont.bold.size(.textEighteen)
        case .titleMedium:
            return LatoFont.medium.size(.textEighteen)
        case .titleRegular:
            return LatoFont.regular.size(.textEighteen)
        case .titleRegularSmall:
            return LatoFont.regular.size(.textSixteen)
        case .titleMediumSmall:
            return LatoFont.medium.size(.textSixteen)
        case .titleMediumSmallest:
            return LatoFont.medium.size(.textTwelve)
        case .navbarMedium:
            return LatoFont.medium.size(.textTwentyOne)
        }
    }
}

enum NeutrifPro: String {
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case regularItalic = "RegularItalic"
    case semiBold = "SemiBold"
    case semiBoldItalic = "SemiBoldItalic"
    private var name: String {
        return "NeutrifPro-\(rawValue)"
    }
    
    func size(_ size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}
