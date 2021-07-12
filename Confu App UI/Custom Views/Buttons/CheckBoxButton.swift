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

}
