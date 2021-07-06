//
//  CFPrimaryFloatingButton.swift
//  Confu
//
//  Created by Waleed Khan on 15/06/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit
import MaterialComponents

class CFPrimaryFloatingButton: MDCFloatingButton {
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {
        super.init(frame: frame, shape: shape)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, backgroundColor: UIColor, titleColor: UIColor, image: UIImage? = nil) {
        super.init(frame: .zero, shape: .default)

        let floatingShapeGenerator = globalShapeGenerator()
        self.shapeGenerator = floatingShapeGenerator

        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        
        self.setTitleColor(titleColor, for: .normal)
        self.setShadowColor(backgroundColor, for: .normal)
        self.setElevation(ShadowElevation(rawValue: 10), for: .normal)
        
        if image != nil {
            self.setImage(image, for: .normal)
        }
    
        setup()
    }
    
    private func setup() {
        self.titleLabel?.adjustsFontSizeToFitWidth = false
        translatesAutoresizingMaskIntoConstraints = false
         self.setTitleFont(RobotoFont.medium.size(13), for: .normal)
        
        self.sizeToFit()
    }
    
    func globalContainerScheme() -> MDCContainerScheming {
        let containerScheme = MDCContainerScheme()
        return containerScheme
    }
    
    func globalShapeGenerator() -> MDCRectangleShapeGenerator {
        let shapeGenerator = MDCRectangleShapeGenerator()
        shapeGenerator.setCorners(MDCCurvedCornerTreatment(size: CGSize(width: 5, height: 5)))
        
        return shapeGenerator
    }
}
