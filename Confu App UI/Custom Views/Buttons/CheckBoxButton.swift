//
//  CheckBoxButton.swift
//  Confu App UI
//
//  Created by Rizwan  Rana on 07/07/2021.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    // Images
    convenience init() {
           self.init(frame: .zero)
           self.setImage(UIImage(named: "checkBox"), for: .normal)
           self.setImage(UIImage(named: "moon"), for: .selected)
           self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
       }

       @objc private func buttonTapped() {
           self.isSelected = !self.isSelected
       }
//    let checkedImage = UIImage(named: "checkBox")! as UIImage
//    let uncheckedImage = UIImage(named: "moon")! as UIImage
//
//    // Bool property
//    var isChecked: Bool = false {
//        didSet {
//            if isChecked == true {
//                self.setImage(checkedImage, for: UIControl.State.normal)
//            } else {
//                self.setImage(uncheckedImage, for: UIControl.State.normal)
//            }
//        }
//    }
//
//    override func awakeFromNib() {
//        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
//        self.isChecked = false
//    }
//
//    @objc func buttonClicked(sender: UIButton) {
//        if sender == self {
//            isChecked = !isChecked
//        }
//    }
}
