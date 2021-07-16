//
//  UIView+MaskPath.swift
//  ProgrammaticUI
//
//  Created by Shayan on 10/06/2021.
//

import UIKit

extension UIView {
    
    @objc var maskPath: UIBezierPath? {
        set {
            let shapeLayer = (layer.mask as? CAShapeLayer) ?? CAShapeLayer()
            shapeLayer.path = newValue?.cgPath
            layer.mask = shapeLayer
        }
        get {
            guard let shapeLayer = layer.mask as? CAShapeLayer, let path = shapeLayer.path else {
                return nil
            }
            return UIBezierPath(cgPath: path)
        }
    }
    
}
