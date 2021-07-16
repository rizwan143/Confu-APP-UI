//
//  UIViewController+Configure.swift
//  ProgrammaticUI
//
//  Created by Shayan on 20/05/2021.
//

import UIKit

extension UIViewController {
//    func createAlert(title: String, message: CFLocalError) {
//        DispatchQueue.main.async {
//            let alert = UIAlertController(title: title, message: message.rawValue, preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
//                alert.dismiss(animated: true, completion: nil)
//            }
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
    
    func createAlert(title: String? = nil, message: String? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func createAlertWithoutButton() -> UIAlertController {
        let alert = UIAlertController(title: "Oops", message: "We have a problem.", preferredStyle: .alert)
        
        DispatchQueue.main.async {
            
            self.present(alert, animated: true, completion: nil)
        }
        
        return alert
    }
    
    func createHotspotAlert(title: String? = nil, message: String? = nil, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                alert.dismiss(animated: true) {
                    completion(true)
                }
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func presentFeedbackAlert(with vc: UIViewController) {
        DispatchQueue.main.async {
            let feedbackAlert = vc
            feedbackAlert.modalPresentationStyle = .overFullScreen
            feedbackAlert.modalTransitionStyle = .crossDissolve
            self.present(feedbackAlert, animated: true)
        }
    }
}

// This extension is marked @nonobjc so it won't conflict with any of Apple's own code
@nonobjc extension UIViewController {

    func add(_ child: UIViewController, to containerView: UIView) {
        
        addChild(child)
        containerView.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        child.didMove(toParent: self)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}

