//
//  LandingVC.swift
//  ProgrammaticUI
//
//  Created by Shayan on 20/05/2021.
//

import UIKit
import Combine

class LandingVC: UIViewController {
    private let landingView = LandingView()
    var navigationState = NavigationStates.shared
    
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        //        landingView.tabBarView.landingVC = self
        landingView.tabBarView.delegate = self
        view = landingView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atStart()
        setupListener()
    }
 
    
    private func atStart(){
        
        landingView.tabBarView.position = 1
        add(CallContactsVC(), to:  landingView.mainView)
        setState(state: .start)
        //        navigationState.setState(state: ScreenState.start)
    }
}

extension LandingVC {
    //This listener for the states which are being changed outside of Bottom Nav
    private func setupListener(){
        navigationState.$state.sink { [self] value in
            if value == .callClick {
                setState(state: .endCallClick)
                callScreenBotNavImages()
                landingView.tabBarView.position = 1
                openVC(vc: OnCallViewController())
            }
            else if value == .invitePeople
            {
                setState(state: .endCallClick)
                startScreenBotNavImages()
                openVC(vc: InviteConfuViewController())
            }
        }.store(in: &cancellables)
    }
}

extension LandingVC: FloatingTabBarDelegate {
    func floatingTabBarDidSelect(item: FloatingTabItem, index: Int) {
        print("ITEM CLICKED: \(index) STATE: \(navigationState.getState())")
        landingView.tabBarView.position = CGFloat(index)
        
        
        openScreen(index: index)
    }
    
    private func openScreen(index: Int){
        
        switch navigationState.getState() {
        case .start,.nearbyClick, .qrClick:
            startScreen(index: index)
        case .contactClick:
            contactClick(index: index)
        case .recentAndFavouriteClick:
            return
        case .callClick:
            callScreenClick(index: index)
        case .endCallClick:
            return
        case .invitePeople:
            startScreen(index: index)
        }
    }
    
    private func startScreen(index: Int){
        if index == 0 {
            openVC(vc: CallHistoryVC())
            setState(state: .nearbyClick)
        } else if index == 1 {
            openVC(vc: CallContactsVC())
            setState(state: .contactClick)
        } else {
            openVC(vc: TableViewVC())
            setState(state: .qrClick)
        }
    }
    
    private func contactClick(index: Int){
        if index == 0 {
            openVC(vc: CallHistoryVC())
            setState(state: .nearbyClick)
        } else if index == 1 {
            openVC(vc: OnCallViewController())
        } else {
            openVC(vc: TableViewVC())
            setState(state: .qrClick)
        }
    }
    
    private func callScreenClick(index: Int){
        if index == 0 {
            return
        } else if index == 1 {
            setState(state: .start)
            startScreenBotNavImages()
            landingView.tabBarView.position = 0
            openVC(vc: CallHistoryVC())
        } else {
            return
        }
    }
    private func inviteScreenClick(index: Int){
        if index == 0 {
            return
        } else if index == 1 {
            setState(state: .start)
            startScreenBotNavImages()
            openVC(vc: InviteConfuViewController())
        } else {
            return
        }
    }
    
    
    private func callScreenBotNavImages(){
        landingView.tabBarView.updateImage(index: 0, image: UIImage(named: "addMembersTab")!, selectedImage: UIImage(named: "recentTapSelected.png")!)
        landingView.tabBarView.updateImage(index: 1, image: UIImage(named: "callTab")!, selectedImage: UIImage(named: "callTabSelected.png")!)
        landingView.tabBarView.updateImage(index: 2, image: UIImage(named: "chatTabUnselected")!, selectedImage: UIImage(named: "scanTabSelected.png")!)
    
    }
    
    private func startScreenBotNavImages(){
        landingView.tabBarView.updateImage(index: 0, image: UIImage(named: "recentTabUnselected.png")!, selectedImage: UIImage(named: "recentTapSelected.png")!)
        landingView.tabBarView.updateImage(index: 1, image: UIImage(named: "callTabUnselected.png")!, selectedImage: UIImage(named: "tickTabSelected.png")!)
        landingView.tabBarView.updateImage(index: 2, image: UIImage(named: "scanTab.png")!, selectedImage: UIImage(named: "scanTabSelected.png")!)
        
        
        
     
     
        
        
    }
}

extension LandingVC {
    private func openVC(vc: UIViewController){
        add(vc, to: landingView.mainView)
    }
    
    private func setState(state: ScreenState){
        navigationState.setState(state: state)
    }
}

