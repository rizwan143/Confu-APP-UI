//
//  recentTableViewCell.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 13/07/2021.
//

import UIKit

class recentTableViewCell: UITableViewCell {
    let avatarImage = CFImageView(frame: .zero)
    let lblBody = CFBodyLabel(text: "Rizwan")
    let lblcallStatus = CFBodyLabel(text: "outgoing")
    let lblDate = CFBodyLabel(text: "10/10/21")
    let callImage = CFImageView(frame: .zero)
    let infoImage = CFImageView(frame: .zero)
    let groupImages = UIView()
    let personImage = CFImageView(frame: .zero)
    let personSmallImage = CFImageView(frame: .zero)
    let noOfPersonLbl =  CFBodyLabel(text: "+5")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupScreen()
    }
    private func setupAvatarImageView() {
        addSubview(avatarImage)
    
        avatarImage.image = UIImage(named: "image3")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
           // avatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 40),
            avatarImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func setupGroupCallView() {
        addSubview(groupImages)
        
        groupImages.backgroundColor = .white
        groupImages.layer.cornerRadius = 10
        groupImages.clipsToBounds = true
        groupImages.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            groupImages.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            groupImages.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            groupImages.heightAnchor.constraint(equalToConstant: 40),
            groupImages.widthAnchor.constraint(equalToConstant: 70)
            
        ])
        
        //Image1
        groupImages.addSubview(personImage)
        personImage.image = UIImage(named: "image3")
        personImage.translatesAutoresizingMaskIntoConstraints = false
       // checkMarkImage.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: groupImages.topAnchor, constant: 0),
            personImage.leadingAnchor.constraint(equalTo: groupImages.leadingAnchor),
            personImage.heightAnchor.constraint(equalToConstant: 40),
            personImage.widthAnchor.constraint(equalToConstant: 40)
        ])
//
        //Image2
        groupImages.addSubview(personSmallImage)
        personSmallImage.image = UIImage(named: "image1")
        personSmallImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personSmallImage.bottomAnchor.constraint(equalTo: personImage.bottomAnchor),
            personSmallImage.leadingAnchor.constraint(equalTo: personImage.trailingAnchor),
            personSmallImage.heightAnchor.constraint(equalToConstant: 28),
            personSmallImage.widthAnchor.constraint(equalToConstant: 28)
        ])
//
//        //Label Count
        addSubview(noOfPersonLbl)

        noOfPersonLbl.font = RobotoFont.regular.size(10)
        noOfPersonLbl.textColor = .white
        noOfPersonLbl.numberOfLines = 1
        noOfPersonLbl.backgroundColor = .black
        noOfPersonLbl.layer.masksToBounds = true
        noOfPersonLbl.layer.cornerRadius = 10
        
        noOfPersonLbl.textAlignment = .center
        NSLayoutConstraint.activate([
           // lblBody.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            noOfPersonLbl.centerYAnchor.constraint(equalTo: groupImages.centerYAnchor, constant: -15),
            noOfPersonLbl.leadingAnchor.constraint(equalTo: groupImages.leadingAnchor, constant: 30),
            noOfPersonLbl.heightAnchor.constraint(equalToConstant: 20),
            noOfPersonLbl.widthAnchor.constraint(equalToConstant: 20)

        ])
        
        
        
    }
    private func setupTitleLabel() {
        addSubview(lblBody)
        
        lblBody.font = RobotoFont.medium.size(16)
        lblBody.textColor = .black
        lblBody.numberOfLines = 1
        lblBody.textAlignment = .left
        NSLayoutConstraint.activate([
           // lblBody.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lblBody.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor, constant: -12),
            lblBody.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 35),
           
        ])
    }
    private func setupCallStatusLabel() {
        addSubview(lblcallStatus)
        
        lblcallStatus.font = RobotoFont.regular.size(14)
        lblcallStatus.textColor = .darkGray
        lblcallStatus.numberOfLines = 1
        lblcallStatus.textAlignment = .left
        NSLayoutConstraint.activate([
           // lblBody.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lblcallStatus.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor, constant: 12),
            lblcallStatus.leadingAnchor.constraint(equalTo: callImage.trailingAnchor, constant: 7),
           
        ])
    }
    private func setupinfoImageView() {
        addSubview(infoImage)
    
        infoImage.image = UIImage(named: "info")
        infoImage.translatesAutoresizingMaskIntoConstraints = false
       // checkMarkImage.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            infoImage.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
            infoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 350),
            infoImage.heightAnchor.constraint(equalToConstant: 20),
            infoImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    private func setupDateView() {
        addSubview(lblDate)
    
        lblDate.font = RobotoFont.regular.size(14)
        lblDate.textColor = .darkGray
        lblDate.numberOfLines = 1
        lblDate.textAlignment = .left
       // checkMarkImage.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            lblDate.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
            lblDate.trailingAnchor.constraint(equalTo: infoImage.leadingAnchor, constant: -12),
         
        ])
    }
    private func setupcallImageView() {
        addSubview(callImage)
    
        callImage.image = UIImage(named: "call_Icon")
        callImage.translatesAutoresizingMaskIntoConstraints = false
       // checkMarkImage.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            callImage.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor, constant: 12),
            callImage.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 35),
            callImage.heightAnchor.constraint(equalToConstant: 14),
            callImage.widthAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupScreen() {
        setupAvatarImageView()
        setupGroupCallView()
        setupTitleLabel()
        setupcallImageView()
        setupCallStatusLabel()
        setupinfoImageView()
        setupDateView()
        
    }
    
}
