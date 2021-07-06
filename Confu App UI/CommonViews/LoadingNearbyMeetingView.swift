////
////  EmptyNearbyMeetingView.swift
////  Confu
////
////  Created by Waleed Khan on 09/07/2020.
////  Copyright © 2020 Shayan Zahid. All rights reserved.
////
//
//import UIKit
////import SwiftGifOrigin
//
//class LoadingNearbyMeetingView: UIView {
//    
//    let view = UIView()
//    let title = UILabel()
//    let imageView = UIImageView()
//    let subTitle = UILabel()
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    init(gifName: String, text: String, buttonTitle: String) {
//        super.init(frame: .zero)
//        
//        translatesAutoresizingMaskIntoConstraints = false
//        self.backgroundColor = UIColor().backgroundColor
//        setImage(gifName: gifName, text: text, buttonTitle: buttonTitle)
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension LoadingNearbyMeetingView {
//    func setImage(gifName: String, text: String, buttonTitle: String) {
//        
//        addSubview(view)
//        view.addSubview(title)
//        view.addSubview(imageView)
//        view.addSubview(subTitle)
//
//        title.numberOfLines = 0
//        subTitle.numberOfLines = 0
//        
//        title.textAlignment = .center
//        subTitle.textAlignment = .center
//        
//        view.backgroundColor = .clear
//        
////        title.textColor = UIColor().titleColor
////        subTitle.textColor = UIColor().subTitleColor2
//        
//        title.font = RobotoFont.bold.size(16)
//        subTitle.font = RobotoFont.regular.size(14)
//        
//        title.text = text
//        
//     //   imageView.loadGif(name: gifName)
//        subTitle.text = buttonTitle
//        
//        imageView.contentMode = .scaleAspectFit
//        
//        view.translatesAutoresizingMaskIntoConstraints = false
//        title.translatesAutoresizingMaskIntoConstraints = false
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        subTitle.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            view.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//        ])
//        
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
//            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//            title.topAnchor.constraint(equalTo: imageView.bottomAnchor),
//            title.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            title.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
//            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            subTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        
//    }
//}
