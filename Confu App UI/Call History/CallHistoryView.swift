//
//  CallHistoryView.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 09/07/2021.
//

import UIKit

class CallHistoryView: UIView {

    var CallHistoryVC: CallHistoryVC? {
                didSet {
                  
        
                }
            }
    var uvHeader = UIView()
    
    let logoLbl = CFBodyLabel(text: StaticLabels.cpAppNameText.rawValue)
    let ivAvatarImage = CFAvatarImageView(frame: .zero)
    let calenderImage = CFImageView(frame: .zero)
    let emptyImage = CFImageView(frame: .zero)
    let scrollView = UIScrollView()
    let contentView = UIView()
    var buttonBottomConstraint = NSLayoutConstraint()
    let padding: CGFloat = 20
    let secondaryPadding: CGFloat = 40
    let emptyLbl = CFBodyLabel(text: StaticLabels.pnNoMeetingFound.rawValue)
    let emptySubLbl = CFBodyLabel(text: StaticLabels.pnInstructionText.rawValue)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setupHeaderView() {
//        addSubview(uvHeader)
//
//        uvHeader.backgroundColor = .black
//
//        uvHeader.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            uvHeader.topAnchor.constraint(equalTo: topAnchor),
//            uvHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
//            uvHeader.trailingAnchor.constraint(equalTo: trailingAnchor)
//
//        ])
//    }
    
    private func setuplogoLabel() {
        addSubview(logoLbl)
        logoLbl.translatesAutoresizingMaskIntoConstraints = false
        logoLbl.font = RobotoFont.medium.size(20)
        logoLbl.textColor = .black
        logoLbl.numberOfLines = 1
        logoLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            logoLbl.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            logoLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            //logoLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    private func setupAvatarImageView() {
        addSubview(ivAvatarImage)
    
        ivAvatarImage.image = UIImage(named: "myProfile")
        ivAvatarImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ivAvatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            ivAvatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ivAvatarImage.heightAnchor.constraint(equalToConstant: 40),
            ivAvatarImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func setupCalenderImageView() {
        addSubview(calenderImage)
    
        calenderImage.image = UIImage(named: "calender")
        calenderImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calenderImage.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            calenderImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            calenderImage.heightAnchor.constraint(equalToConstant: 28),
            calenderImage.widthAnchor.constraint(equalToConstant: 34)
        ])
    }
    private func setupEmptyImageView() {
        addSubview(emptyImage)
    
        emptyImage.image = UIImage(named: "emptyContacts")
        emptyImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyImage.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            emptyImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
           // emptyImage.centerYAnchor.constraint(equalTo: centerYAnchor),
           // emptyImage.bottomAnchor.constraint(equalTo: uvHeader.bottomAnchor, constant: 40),
            emptyImage.heightAnchor.constraint(equalToConstant: 230),
            emptyImage.widthAnchor.constraint(equalToConstant: 230)
        ])
    }
    private func setupEmptyLabel() {
        addSubview(emptyLbl)
        emptyLbl.translatesAutoresizingMaskIntoConstraints = false
        emptyLbl.font = RobotoFont.medium.size(20)
        emptyLbl.textColor = .black
        emptyLbl.numberOfLines = 1
        emptyLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            emptyLbl.topAnchor.constraint(equalTo: emptyImage.bottomAnchor, constant: 30),
            emptyLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptyLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
        ])
    }
    private func setupSubEmptyLabel() {
        addSubview(emptySubLbl)
        emptySubLbl.translatesAutoresizingMaskIntoConstraints = false
        emptySubLbl.font = RobotoFont.regular.size(14)
        emptySubLbl.textColor = .black
        emptySubLbl.numberOfLines = 2
        emptySubLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            emptySubLbl.topAnchor.constraint(equalTo: emptyLbl.bottomAnchor, constant: 10),
            emptySubLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptySubLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
        ])
    }
    
    private func setupScreen() {
        setuplogoLabel()
        setupAvatarImageView()
        setupCalenderImageView()
        setupEmptyImageView()
        setupEmptyLabel()
        setupSubEmptyLabel()
    }

}
