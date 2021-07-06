//
//  CFShape.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class CFShape: UIView {
    override func draw(_ rect: CGRect) {
        createCircle(at: rect, difference: 10, stroke: Colors.mauvePrimary, fill: Colors.mauveSecondary, width: 7)
        createCircle(at: rect, difference: 13, stroke: .white, fill: .clear, width: 5)
        
//        path = UIBezierPath(ovalIn: CGRect(x: rect.width / 2, y: rect.height / 2, width: 140, height: 140))
//        Colors.mauve.setStroke()
//        UIColor.systemBackground.setFill()
//        path.lineWidth = 10
//        path.stroke()
//        path.fill()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCircle(at position: CGRect, difference: Double, stroke: UIColor, fill: UIColor, width: CGFloat) {
        let path = UIBezierPath()
        let radius = Double(position.width) / 2 - difference
        let center = CGPoint(x: position.width / 2, y: position.height / 2)
        
        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y))
        
        for i in stride(from: 0, to: 361.0, by: 1) {
            let radians = i * Double.pi / 180
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        stroke.setStroke()
        fill.setFill()
        path.lineWidth = width
        path.stroke()
        path.fill()
    }
}
