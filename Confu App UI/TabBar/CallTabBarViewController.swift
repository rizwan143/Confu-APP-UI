//
//  CallTabVarVCViewController.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 16/07/2021.
//

import UIKit
import Combine

class CallTabBarViewController: UIViewController {
    private let callTabView = CallTabbarView()
    var navigationState = NavigationStates.shared
    
    private var cancellables = Set<AnyCancellable>()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func loadView() {
        super.loadView()
        //        landingView.tabBarView.landingVC = self
        callTabView.tabBarView.delegate = self
        view = callTabView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atStart()
     //   setupListener()
    }
 
    
    private func atStart(){
        
        callTabView.tabBarView.position = 1
        add(OnCallViewController(), to:  callTabView.mainView)
        setState(state: .start)
        //        navigationState.setState(state: ScreenState.start)
    }
}

//extension CallTabBarViewController {
//    //This listener for the states which are being changed outside of Bottom Nav
//    private func setupListener(){
//        navigationState.$state.sink { [self] value in
//            if value == .callClick {
//                setState(state: .endCallClick)
//                callScreenBotNavImages()
//                openVC(vc: OnCallViewController())
//            }
//
//        }.store(in: &cancellables)
//    }
//}

extension CallTabBarViewController: FloatingTabBarDelegate {
    func floatingTabBarDidSelect(item: FloatingTabItem, index: Int) {
        print("ITEM CLICKED: \(index) STATE: \(navigationState.getState())")
        callTabView.tabBarView.position = CGFloat(index)
        if index == 1
        {
           
            self.dismiss(animated: true, completion: nil)
        }
        if index == 0 {
            let vc = InviteOncallVC()
            
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
//            openVC(vc: InviteOncallVC())
//            setState(state: .nearbyClick)
        }
        else if index == 2 {
//            openVC(vc: InviteOncallVC())
//            setState(state: .nearbyClick)
        }
        //openScreen(index: index)
    }
    
    private func openScreen(index: Int){
        
        switch navigationState.getState() {
        case .start,.nearbyClick, .qrClick:
            startScreen(index: index)
        case .contactClick:
            return
            //contactClick(index: index)
        case .recentAndFavouriteClick:
            return
        case .callClick:
            return
            //callScreenClick(index: index)
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
    
//    private func contactClick(index: Int){
//        if index == 0 {
//            openVC(vc: CallHistoryVC())
//            setState(state: .nearbyClick)
//        } else if index == 1 {
//            openVC(vc: OnCallViewController())
//        } else {
//            openVC(vc: TableViewVC())
//            setState(state: .qrClick)
//        }
//    }
    
//    private func callScreenClick(index: Int){
//        if index == 0 {
//            return
//        } else if index == 1 {
//            setState(state: .start)
//            startScreenBotNavImages()
//            openVC(vc: OnCallViewController())
//        } else {
//            return
//        }
//    }
//    private func inviteScreenClick(index: Int){
//        if index == 0 {
//            return
//        } else if index == 1 {
//            setState(state: .start)
//            startScreenBotNavImages()
//            openVC(vc: InviteConfuViewController())
//        } else {
//            return
//        }
//    }
    
    
//    private func callScreenBotNavImages(){
//        callTabView.tabBarView.updateImage(index: 0, image: UIImage(named: "addMembersTab")!, selectedImage: UIImage(named: "recentTapSelected.png")!)
//        callTabView.tabBarView.updateImage(index: 1, image: UIImage(named: "callTab")!, selectedImage: UIImage(named: "callTabSelected.png")!)
//        callTabView.tabBarView.updateImage(index: 2, image: UIImage(named: "chatTabUnselected")!, selectedImage: UIImage(named: "scanTabSelected.png")!)
//
//    }
//
//    private func startScreenBotNavImages(){
//        callTabView.tabBarView.updateImage(index: 0, image: UIImage(named: "recentTabUnselected.png")!, selectedImage: UIImage(named: "recentTapSelected.png")!)
//        callTabView.tabBarView.updateImage(index: 1, image: UIImage(named: "callTabUnselected.png")!, selectedImage: UIImage(named: "tickTabSelected.png")!)
//        callTabView.tabBarView.updateImage(index: 2, image: UIImage(named: "scanTab.png")!, selectedImage: UIImage(named: "scanTabSelected.png")!)
//
//
        
     
     
        
        
  //  }
}

extension CallTabBarViewController {
    private func openVC(vc: UIViewController){
        add(vc, to: callTabView.mainView)
    }
    
    
    
    private func setState(state: ScreenState){
        navigationState.setState(state: state)
    }
}

