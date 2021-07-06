//
//  EmptyNearbyMeetingContentView.swift
//  Confu
//
//  Created by Waleed Khan on 09/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class EmptyNearybyMeetingContentView: UIView {

    let view = UIView()
    let title = UILabel()
    let imageView = UIImageView()
    let subTitle = UILabel()
    
    let btnTryAgain = CFOutlineButton(title: "Try, again", titleColor: .black)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(image: UIImage, text: String, buttonTitle: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        setImage(image: image, text: text, buttonTitle: buttonTitle)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyNearybyMeetingContentView {
    func setImage(image: UIImage, text: String, buttonTitle: String) {
        
        addSubview(view)
        view.addSubview(title)
        view.addSubview(imageView)
        view.addSubview(subTitle)
        view.addSubview(btnTryAgain)
    
        title.numberOfLines = 0
        subTitle.numberOfLines = 0
        
        title.textAlignment = .center
        subTitle.textAlignment = .center
        
        view.backgroundColor = .clear
        
        title.textColor = .black
        subTitle.textColor = .black
        
        title.font = RobotoFont.bold.size(16)
        subTitle.font = RobotoFont.regular.size(14)
        
        title.text = text
        imageView.image = image
        subTitle.text = buttonTitle
        
        imageView.contentMode = .scaleAspectFit
        
        view.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            btnTryAgain.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 30),
            btnTryAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnTryAgain.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            btnTryAgain.heightAnchor.constraint(equalToConstant: 50),
            btnTryAgain.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
}

