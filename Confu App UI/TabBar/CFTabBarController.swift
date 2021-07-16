//
//  CFTabBarController.swift
//  ProgrammaticUI
//
//  Created by Shayan on 19/05/2021.
//

import UIKit

class CFTabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)

        object_setClass(self.tabBar, CustomTabBar.self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

//        NotificationCenter.default.addObserver(self, selector: #selector(self.pushToCallVC), name: NSNotification.Name(NSNotificationNames.callNotification.rawValue), object: nil)

//        setupMicrophonePermissions()
        setupSwipeGestures()
    }

    @objc func pushToCallVC(_ notification: Notification) {

//        let pushKitNotification = notification.object as! PushKitNotification
//        let callVC = CallVC(pushKitNotification: pushKitNotification)
//
//        if let currentNavigationController = selectedViewController as? UINavigationController {
//
//            currentNavigationController.pushViewController(callVC, animated: true)
//        }
    }

    func setupSwipeGestures() {

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }

    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {

        if gesture.direction == .left {
            if (self.selectedIndex) < 3 {
                self.selectedIndex += 1
            }
        } else if gesture.direction == .right {
            if (self.selectedIndex) > 0 {
                self.selectedIndex -= 1
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
}

extension CFTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideTransition(viewControllers: tabBarController.viewControllers)
    }
}

class CustomTabBar: UITabBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        guard let window = keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = window.safeAreaInsets.bottom + 59
        return sizeThatFits
    }
}

