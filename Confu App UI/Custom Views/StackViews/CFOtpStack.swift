//
//  CFOtpStack.swift
//  ConfuNewDesign
//
//  Created by Shayan on 01/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

protocol OTPDelegate: class {
    //always triggers when the OTP field is valid
    func didChangeValidity(isValid: Bool)
}

class CFOtpStack: UIStackView {
    //Customise the OTPField here
    let numberOfFields = 6
    var textFieldsCollection: [CFOtpTextField] = []
    weak var delegate: OTPDelegate?
    var showsWarningColor = false
    
    //Colors
//    let inactiveFieldBorderColor =  UIColor().oPTBackgroundColor
//
//    let textBackgroundColor = UIColor().titleColor
//
//    let activeFieldBorderColor = UIColor().oPTBackgroundColor
//
//
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        addOTPFields()
    }
    
    //Customisation and setting stackView
    func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 15
    }
    
    //Adding each OTPfield to stack view
    func addOTPFields() {
        for index in 0..<numberOfFields {
            let field = CFOtpTextField()
            setupTextField(field)
            textFieldsCollection.append(field)
            //Adding a marker to previous field
            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
            //Adding a marker to next field for the field at index-1
            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
        }
        //setting first field as firstResponder
        textFieldsCollection[0].becomeFirstResponder()
    }
    
    //Customisation and setting OTPTextFields
    func setupTextField(_ textField: CFOtpTextField) {
        textField.delegate = self
        textField.tintColor = .black//UIColor().primaryDark
        //Adding constraints wrt to its parent i.e OTPStackView
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(textField)
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        //        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //        textField.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        textField.backgroundColor = .white
            //UIColor().oPTBackgroundColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
        textField.font = RobotoFont.regular.size(21)
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
       // textField.layer.borderColor = .black
        textField.keyboardType = .numberPad
    }
    
    //checks if all the OTPfields are filled
    func checkForValidity() {
        for fields in textFieldsCollection {
            if (fields.text == "") {
                delegate?.didChangeValidity(isValid: false)
                return
            }
        }
        delegate?.didChangeValidity(isValid: true)
    }
    
    //gives the OTP text
    func getOTP() -> String {
        var OTP = ""
        for textField in textFieldsCollection{
            OTP += textField.text ?? ""
        }
        return OTP
    }
    
    //set isWarningColor true for using it as a warning color
    func setAllFieldColor(isWarningColor: Bool = false, color: UIColor) {
        for textField in textFieldsCollection{
            textField.layer.borderColor = color.cgColor
        }
        showsWarningColor = isWarningColor
    }
    
}

//TextField related operations
extension CFOtpStack: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if showsWarningColor {
          //  setAllFieldColor(color: inactiveFieldBorderColor)
            showsWarningColor = false
        }
      //  textField.layer.borderColor = activeFieldBorderColor.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       // textField.layer.borderColor = inactiveFieldBorderColor.cgColor
    }
    
    //switches between OTPTextfields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
        
        guard let textField = textField as? CFOtpTextField else { return true }
        
        if (range.length == 0){
            
            if textField.nextTextField == nil {
                textField.resignFirstResponder()
            }else{
                textField.nextTextField?.becomeFirstResponder()
            }
            textField.text? = string
            checkForValidity()
            return false
            
        }
        else if (range.length == 1) {
            
            textField.previousTextField?.becomeFirstResponder()
            textField.text? = ""
            checkForValidity()
            return false
            
        }
        return true
    }
    
}
