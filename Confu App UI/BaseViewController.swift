//
//  BaseViewController.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 12/07/2021.
//

import UIKit

class BaseViewController: UIViewController {
 
    let logoLbl = CFBodyLabel(text: StaticLabels.cpAppNameText.rawValue)
    let ivAvatarImage = CFAvatarImageView(frame: .zero)
    let calenderImage = CFImageView(frame: .zero)
        override func viewDidLoad() {
            super.viewDidLoad()
            setupScreen()
            
        }
    private func setupScreen() {
        self.view.backgroundColor = .white
        setuplogoLabel()
        setupAvatarImageView()
        setupCalenderImageView()
    }

    private func setuplogoLabel() {
        view.addSubview(logoLbl)
        logoLbl.translatesAutoresizingMaskIntoConstraints = false
        logoLbl.font = RobotoFont.bold.size(25)
        logoLbl.textColor = .black
        logoLbl.numberOfLines = 1
        logoLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            logoLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //logoLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    private func setupAvatarImageView() {
        view.addSubview(ivAvatarImage)
    
        ivAvatarImage.image = UIImage(named: "myProfile")
        ivAvatarImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ivAvatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            ivAvatarImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ivAvatarImage.heightAnchor.constraint(equalToConstant: 40),
            ivAvatarImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func setupCalenderImageView() {
        view.addSubview(calenderImage)
    
        calenderImage.image = UIImage(named: "calender")
        calenderImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calenderImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            calenderImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            
            calenderImage.heightAnchor.constraint(equalToConstant: 28),
            calenderImage.widthAnchor.constraint(equalToConstant: 34)
        ])
    }
    }

