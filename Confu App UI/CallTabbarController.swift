//
//  CallTabbarController.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 14/07/2021.
//

import UIKit
import SOTabBar

class CallTabbarController: SOTabBarController {
    
    var vc1 = UINavigationController(rootViewController: OnCallViewController())
    var vc2 = UINavigationController(rootViewController: OnCallViewController())
    var vc3 = UINavigationController(rootViewController: OnCallViewController())
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
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.delegate = self
       
        vc1.isNavigationBarHidden = true
        vc2.isNavigationBarHidden = true
        vc3.isNavigationBarHidden = true
        vc1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "addMembersTab"), selectedImage: UIImage(named: "membersTabSelected"))
        vc2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "callTab"), selectedImage: UIImage(named: "callTabSelected"))
        vc3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "chatTabUnselected"), selectedImage: UIImage(named: "scanTabSelected"))
        viewControllers = [vc1, vc2,vc3]
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
}
extension CallTabbarController: SOTabBarControllerDelegate {
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
        print(selectedIndex)
       
        if viewController.tabBarItem.image == UIImage(named: "callTab")
        {
            self.dismiss(animated: true, completion: nil)
        }
       
//        if viewController == OnCallViewController()
//        {
            
      //  }
    }
    
  
    }


