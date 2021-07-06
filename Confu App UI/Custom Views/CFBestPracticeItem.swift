//
//  CFBestPracticeItem.swift
//  ConfuNewDesign
//
//  Created by Shayan on 02/04/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFBestPracticeItem: UIStackView {
    
    var titleButton: CFButton?
    
    var descriptionCaption: CFCaption?
    
    var descriptionFont: UIFont?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        axis = .vertical
        spacing = 5
        alignment = .leading
        
        titleButton = CFButton(buttonImage: UIImage(systemName: "chevron.up")!)
        titleButton!.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        //MARK: - THIS IS DEFINITELY NOT THE WAY TO DO RESPONSIVE
//        titleButton!.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -160);
//        titleButton!.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 180);
//        titleButton!.backgroundColor = .red
        
        descriptionFont = FontBook.subHeadline.font
        
        descriptionCaption = CFCaption(labelText: Captions.bpBullets[0], labelFont: descriptionFont!)
//        descriptionCaption?.isHidden = true
        
        setupView()
    }
    
    func setupView() {
        setupTitleButton()
        setupDescription()
    }
    
    private func setupTitleButton() {
        addArrangedSubview(titleButton!)
    }
    
    private func setupDescription() {
        addArrangedSubview(descriptionCaption!)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
