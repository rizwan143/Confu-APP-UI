//
//  BestPracticesVC.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class BestPracticesVC: UIViewController {
    let bestPracticesView = BestPracticesView()
    
   // let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    
    override func loadView() {
        super.loadView()
        
        bestPracticesView.bestPracticesVC = self
        view = bestPracticesView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bestPracticesView.scrollView.delegate = self
    }
    
    @objc func callToActionTapped() {
      //  navigationController?.pushViewController(CreateProfileVC(), animated: true)
    }
    
    @objc func nextTapped() {

        let pageNumber = bestPracticesView.scrollView.contentOffset.x / bestPracticesView.scrollView.frame.size.width
        bestPracticesView.pageControl.currentPage = Int(pageNumber + 1)

        if pageNumber >= 4.0 {
            
          //  sceneDelegate?.changeRootViewController(sceneDelegate!.createTabBar())
        } else {
            if bestPracticesView.scrollView.contentOffset.x < view.bounds.width * CGFloat(bestPracticesView.slides.count - 1) {
                
                UIView.animate(withDuration: 0.3) {
                    self.bestPracticesView.scrollView.contentOffset.x += self.view.bounds.width
                }
            }
        }
    }
    
    @objc func skipTapped() {
        
      //  sceneDelegate?.changeRootViewController(sceneDelegate!.createTabBar())
    }
}

extension BestPracticesVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        bestPracticesView.pageControl.currentPage = Int(pageNumber)
    }
}
