//
//  Extensions.swift
//  Confu App UI
//
//  Created by Rizwan  Rana on 06/07/2021.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    var fontSize:CGFloat { return 18 }
    var textFont :CGFloat { return 14 }
    var boldFont:UIFont { return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var ExtraboldFont:UIFont { return UIFont(name: "AvenirNext-Bold", size: 50) ?? UIFont.boldSystemFont(ofSize: 50) }
    var normalFont:UIFont { return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    var smallFont:UIFont { return UIFont(name: "AvenirNext-Regular", size: textFont) ?? UIFont.systemFont(ofSize: textFont)}
    
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    func textViewFont(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : smallFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    /* Other styling methods */
    func appThemeColor(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  boldFont,
            .foregroundColor : hexStringToUIColor(hex: "#00A899"),
            .backgroundColor : UIColor.white
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func extraBold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  ExtraboldFont,
            .foregroundColor : UIColor.black,
            .backgroundColor : UIColor.white
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    func extraBoldColored(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  ExtraboldFont,
            .foregroundColor : hexStringToUIColor(hex: "#00A899"),
            .backgroundColor : UIColor.white
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

