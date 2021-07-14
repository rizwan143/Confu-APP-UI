//
//  TabbarController.swift
//  Confu App UI
//
//  Created by Rizwan  Rana on 02/07/2021.
//

import UIKit
import SOTabBar
class TabbarController: SOTabBarController {

    var vc1 = UINavigationController(rootViewController: CallHistoryVC())
    var vc2 = UINavigationController(rootViewController: CollectionViewVC())
    var vc3 = UINavigationController(rootViewController: TableViewVC())
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
        
        
       
        vc1.isNavigationBarHidden = true
        vc2.isNavigationBarHidden = true
        vc3.isNavigationBarHidden = true
        vc1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "recentTapSelected"))
        vc2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "callTabUnselected"), selectedImage: UIImage(named: "tickTabSelected"))
        vc3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "music"), selectedImage: UIImage(named: "scanTabSelected"))
        viewControllers = [vc1, vc2,vc3]
       
    }
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
}

extension TabbarController: SOTabBarControllerDelegate {
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
        
    }
}
