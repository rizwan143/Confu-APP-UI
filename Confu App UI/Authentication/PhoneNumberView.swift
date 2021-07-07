//
//  PhoneNumberView.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 10/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class PhoneNumberView: UIView, UITextViewDelegate {
    var phoneNumberVC: PhoneNumberVC? {
        didSet {
            actionButton.addTarget(phoneNumberVC, action: #selector(PhoneNumberVC.actionButtonTapped), for: .touchUpInside)
        }
    }
    
    // Classes starting with CF are our custom subclassed UILabels, UIButtons, UITextFields etc
    private let largeTitleLabel = CFLargeTitleLabel(text: StaticLabels.pnViewLargeText.rawValue, textColor: .black)
    private let bodyLabel = CFBodyLabel(text: StaticLabels.pnViewBodyText.rawValue)
    private let phoneLabel = CFBodyLabel(text: StaticLabels.pnViewPhoneText.rawValue)
    private let countryLabel = CFBodyLabel(text: StaticLabels.pnViewCountryText.rawValue)
    private let termsAndConditionsLabel = CFBodyLabel(text: StaticLabels.pnViewTermsandCondtionText.rawValue)
    let actionButton = CFPrimaryButton(title: "REGISTER", backgroundColor: .black, titleColor: .white)
    let checkBoxButton = CheckBox()
    
    var tfPhoneNumber = CFPhoneNumberField()
    
    var buttonBottomConstraint = NSLayoutConstraint()
    
    let padding: CGFloat = 20
    let secondaryPadding: CGFloat = 20
   
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        setupScreen()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    private func setupLargeTitleLabel() {
        addSubview(largeTitleLabel)
        
        largeTitleLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            largeTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            largeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            largeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
        largeTitleLabel.textAlignment = .center
    }
    

    
    private func setupBodyLabel() {
        addSubview(bodyLabel)
        
        bodyLabel.textColor = .black
        
        bodyLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: largeTitleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
        bodyLabel.textAlignment = .center
    }

    
    
    private func setupPhoneNumberTextField() {
        addSubview(tfPhoneNumber)
        
        tfPhoneNumber.backgroundColor = .clear
        tfPhoneNumber.textColor = .black
        
//        let color = UIColor.lightGray
//        tfPhoneNumber.attributedPlaceholder = NSAttributedString(string: "0123456790", attributes: [NSAttributedString.Key.foregroundColor : color])
        
        
        NSLayoutConstraint.activate([
            tfPhoneNumber.centerYAnchor.constraint(equalTo: centerYAnchor),
            tfPhoneNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            tfPhoneNumber.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -5),
            tfPhoneNumber.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    private func setupPhoneabel() {
        addSubview(phoneLabel)
        
        phoneLabel.textColor = .black
        
        phoneLabel.numberOfLines = 1
        
        NSLayoutConstraint.activate([
            phoneLabel.bottomAnchor.constraint(equalTo: tfPhoneNumber.topAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: tfPhoneNumber.leadingAnchor, constant: 75),
           
        ])
        phoneLabel.textAlignment = .left
    }
    private func setupCountryLabel() {
        addSubview(countryLabel)
        
        countryLabel.textColor = .black
        
        countryLabel.numberOfLines = 1
        
        NSLayoutConstraint.activate([
          //  countryLabel.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 8),
            //bodyLabel.bottomAnchor.constraint(equalTo: largeTitleLabel.bottomAnchor, constant: 8),
            countryLabel.bottomAnchor.constraint(equalTo: tfPhoneNumber.topAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: tfPhoneNumber.leadingAnchor, constant: 5),
            countryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
        countryLabel.textAlignment = .left
    }
    
    private func setupActionButton() {
        addSubview(actionButton)
        buttonBottomConstraint = actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        
        NSLayoutConstraint.activate([
            buttonBottomConstraint,
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: secondaryPadding),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -secondaryPadding),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupCheckBoxButton() {
        addSubview(checkBoxButton)
        checkBoxButton.backgroundColor = .blue
        buttonBottomConstraint = checkBoxButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200)
        
        NSLayoutConstraint.activate([
            checkBoxButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: secondaryPadding),
            checkBoxButton.trailingAnchor.constraint(equalTo: termsAndConditionsLabel.leadingAnchor, constant: secondaryPadding),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 25),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupTermsandConditionLabel() {
        addSubview(termsAndConditionsLabel)
        var textArray = [String]()
        var fontArray = [UIFont]()
        var colorArray = [UIColor]()
        textArray.append("By creating an account, you agree to our ")
        textArray.append("Terms & Condtions")
        
        
        fontArray.append(UIFont.systemFont(ofSize: 12))
        fontArray.append(UIFont.boldSystemFont(ofSize: 12))
        
        colorArray.append(.black)
        colorArray.append(Colors.grayPrimary)
       
        self.termsAndConditionsLabel.attributedText = getAttributedString(arrayText: textArray, arrayColors: colorArray, arrayFonts: fontArray)
        
        self.termsAndConditionsLabel.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.termsAndConditionsLabel.addGestureRecognizer(tapgesture)
          
        termsAndConditionsLabel.textColor = .black
        
        termsAndConditionsLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            termsAndConditionsLabel.topAnchor.constraint(equalTo: tfPhoneNumber.bottomAnchor, constant: 100),
            termsAndConditionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            termsAndConditionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
        termsAndConditionsLabel.textAlignment = .justified
    }

    
    //MARK:- tappedOnLabel
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = self.termsAndConditionsLabel.text else { return }
        let conditionsRange = (text as NSString).range(of: "Terms & Condtions")
       
        if gesture.didTapAttributedTextInLabel(label: self.termsAndConditionsLabel, inRange: conditionsRange) {
            print("user tapped on condition text")
            
            
        }
    }


    //MARK:- getAttributedString
    func getAttributedString(arrayText:[String]?, arrayColors:[UIColor]?, arrayFonts:[UIFont]?) -> NSMutableAttributedString {
        
        let finalAttributedString = NSMutableAttributedString()
        
        for i in 0 ..< (arrayText?.count)! {
            
            let attributes = [NSAttributedString.Key.foregroundColor: arrayColors?[i], NSAttributedString.Key.font: arrayFonts?[i]]
            let attributedStr = (NSAttributedString.init(string: arrayText?[i] ?? "", attributes: attributes as [NSAttributedString.Key : Any]))
            
            if i != 0 {
                
                finalAttributedString.append(NSAttributedString.init(string: " "))
            }
            
            finalAttributedString.append(attributedStr)
        }
        
        return finalAttributedString
    }
    
    private func setupScreen() {
        setupLargeTitleLabel()
        setupBodyLabel()
        setupPhoneNumberTextField()
        setupActionButton()
        setupPhoneabel()
        setupCountryLabel()
        setupTermsandConditionLabel()
        setupCheckBoxButton()
    }
}
extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y);
        var indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        indexOfCharacter = indexOfCharacter + 4
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}
