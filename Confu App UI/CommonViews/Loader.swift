////
////  Loader.swift
////  Confu
////
////  Created by Waleed Khan on 17/06/2020.
////  Copyright © 2020 Shayan Zahid. All rights reserved.
////
//
//import UIKit
//
//class Loader {
//    
//    static func startLoading() {
//        let currentWindow: UIWindow? = UIApplication.shared.windows.first { $0.isKeyWindow }
//        guard let bounds = currentWindow?.bounds else {
//            return
//        }
//        
//        let animationView = AnimationView()
//        let animation = Animation.named("Loader")
//        animationView.animationSpeed = 1.0
//        animationView.loopMode = .loop
//        animationView.animation = animation
//        animationView.contentMode = .scaleAspectFit
//        animationView.frame = CGRect(x: (bounds.width/2)-100, y: (bounds.height/2)-100, width: 200, height: 200)
//        
//        animationView.play()
//        
//        
//        let spinnerView = UIView.init(frame: bounds)
//        spinnerView.backgroundColor = UIColor().backgroundColor
//        
//        DispatchQueue.main.async {
//            spinnerView.addSubview(animationView)
//            spinnerView.tag = 100
//            currentWindow?.addSubview(spinnerView)
//        }
//    }
//    
//    static func stopLoading() {
//        DispatchQueue.main.async {
//            let currentWindow: UIWindow? = UIApplication.shared.windows.first { $0.isKeyWindow }
//            currentWindow?.viewWithTag(100)?.removeFromSuperview()
//        }
//    }
//}
