//
//  CallTabbarView.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 16/07/2021.
//

import UIKit

class CallTabbarView: UIView {
    
     let mainView = MainView()
//     let tabBarView = CustomTabBarView()
    let tabBarView = FloatingTabBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        tabBarView.items = [FloatingTabItem(selectedImage: UIImage(named: "recentTapSelected.png")!, normalImage:                                 UIImage(named: "addMembersTab.png")!),
                            FloatingTabItem(selectedImage: UIImage(named: "callTabSelected.png")!, normalImage: UIImage(named: "callTab.png")!),
                            FloatingTabItem(selectedImage: UIImage(named: "scanTabSelected.png")!, normalImage: UIImage(named: "chatTabUnselected.png")!)]
        
       
        
        
        
        setupViews()
    }
    
    private func setupViews(){
        createMainView()
        createTabBarView()
    }
    
    private func createMainView(){
        addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createTabBarView(){
        addSubview(tabBarView)
        tabBarView.clipsToBounds = true
        tabBarView.layer.cornerRadius = 10
        tabBarView.blurView.layer.cornerRadius = 10
        tabBarView.backgroundColor = .black
        tabBarView.alpha = 1
//        tabBarView.roundCorners(corners: .topLeft, radius: 20)
//        tabBarView.roundCorners(corners: .topRight, radius: 20)
        NSLayoutConstraint.activate([
            tabBarView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10),
            tabBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tabBarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tabBarView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
