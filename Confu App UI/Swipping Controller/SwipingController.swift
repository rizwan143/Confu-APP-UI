//
//  SwipingController.swift
//  Confu App UI
//
//  Created by Rizwan  Rana on 06/07/2021.
//


import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: Initialize swipping array
    let pages = [
        Page(imageName: "armsLength", headerText: "Keep phone at arm’s length", bodyText: "Please keep your smartphone infront of yourself and away from other participating phones to ensure clear audio."),
        Page(imageName: "5gPrefferable", headerText: "5G Network is Preferable", bodyText: "Please connect to a local 5ghz Wireless Network to ensure a good experience.The network may also be a Hotspot created by the person initiating the call."),
        Page(imageName: "keepDistance", headerText: "Keep Distance Between Phone", bodyText: "Please keep your smart phone infront of yourself 10 inches away from your face"),
        Page(imageName: "phoneVolume", headerText: "Drop Phone Volume", bodyText: "Please do not turn up your smart phone’s volume to max as the collective audio generated may get too loud."),
        Page(imageName: "meetingTime", headerText: "Shedule Meeting time Carefully", bodyText: "Meeting time to be set should be at least 5 minutes ahead from the current time"),
       
    ]


    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // MARK:  Next Button Outlet
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SKIP", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    // MARK: Page Control Outlet
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    // MARK: Next Button Action
    @objc private func handleNext() {
        let tabBarController =  TabbarController()
        appDelegate.window?.rootViewController = tabBarController

    }
  
    // MARK: Constraints Setup
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [ pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .equalSpacing
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
           // bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    // MARK: PageControl Velocity handler
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        if pageControl.currentPage == 4
        {
            nextButton.setTitle("START", for: .normal)
        }
        else
        {
            nextButton.setTitle("SKIP", for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
}
