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
        SOTabBarSetting.tabBarTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        let firstViewController = ViewController()
        firstViewController.title = "Home"
        firstViewController.view.backgroundColor = .black
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home-1"), selectedImage: UIImage(named: "home_Selected"))
      //  firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let secondViewController = CollectionViewVC()
        secondViewController.title = "LIVE"
        secondViewController.view.backgroundColor = .gray
        secondViewController.tabBarItem = UITabBarItem(title: "LIVE", image: UIImage(named: "moon-1"), selectedImage: UIImage(named: "moon_Selected"))

      //  secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        
        let thirdViewController = TableViewVC()
        thirdViewController.title = "Party"
        thirdViewController.view.backgroundColor = .white
       // thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        thirdViewController.tabBarItem = UITabBarItem(title: "Party", image: UIImage(named: "music-1"), selectedImage: UIImage(named: "music_Selected"))
        
        
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
