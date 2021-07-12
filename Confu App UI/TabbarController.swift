//
//  TabbarController.swift
//  Confu App UI
//
//  Created by Rizwan  Rana on 02/07/2021.
//

import UIKit
import SOTabBar
class TabbarController: SOTabBarController {

    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        SOTabBarSetting.tabBarTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
        SOTabBarSetting.tabBarBackground = .black
        self.hidesBottomBarWhenPushed = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        let firstViewController = CallHistoryVC()
        firstViewController.title = "Home"
        firstViewController.view.backgroundColor = .white
        firstViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "recentTapSelected"))
      //  firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let secondViewController = CollectionViewVC()
        secondViewController.title = "LIVE"
        secondViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "callTabUnselected"), selectedImage: UIImage(named: "tickTabSelected"))

      //  secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        
        let thirdViewController = TableViewVC()
        thirdViewController.title = "Party"
        thirdViewController.view.backgroundColor = .white
       // thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        thirdViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "music"), selectedImage: UIImage(named: "scanTabSelected"))
        
        
//        homeStoryboard.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_Selected"))
//        chatStoryboard.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chat"), selectedImage: UIImage(named: "chat_Selected"))
//        sleepStoryboard.tabBarItem = UITabBarItem(title: "Sleep", image: UIImage(named: "moon"), selectedImage: UIImage(named: "moon_Selected"))
//        musicStoryboard.tabBarItem = UITabBarItem(title: "Music", image: UIImage(named: "music"), selectedImage: UIImage(named: "music_Selected"))
//        meStoryboard.tabBarItem = UITabBarItem(title: "Me", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menu_Selected"))

        viewControllers = [firstViewController, secondViewController,thirdViewController]
    }
    
    
}

extension TabbarController: SOTabBarControllerDelegate {
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
}
