//
//  NavigationStates.swift
//  ProgrammaticUI
//
//  Created by Shayan on 12/06/2021.
//

import UIKit
import Combine

class NavigationStates {
    static let shared = NavigationStates()
    
//    var updateLabel: ((_ value: ScreenState) -> Void)?
    
    @Published var state = ScreenState.start
//        didSet {
//            print("DID SET THE VARAUBLE: \(state)")
//
//        }
    
    
    private init(){}
    
//    var labelChange: String = Model().callElements() {
//        didSet {
//            updateLabel?()
//        }
//    }
    
    func setState(state: ScreenState){
        self.state = state
    }
    
    func getState() -> ScreenState{
        return self.state
    }
}
enum ScreenState {
    case start
    case nearbyClick
    case contactClick
    case recentAndFavouriteClick
    case qrClick
    case callClick
    case endCallClick
    case invitePeople
}
