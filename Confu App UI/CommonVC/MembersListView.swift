//
//  MembersListView.swift
//  Confu
//
//  Created by Waleed Khan on 14/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//


import UIKit

class MembersListView: UIView {
    
    let tvMembers = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupTableView() {
        addSubview(tvMembers)
        tvMembers.translatesAutoresizingMaskIntoConstraints = false
        tvMembers.backgroundColor = .clear
        tvMembers.separatorStyle = .none
        
        
        tvMembers.register(CallMemberCell.self, forCellReuseIdentifier: CallMemberCell.reuseID)
        NSLayoutConstraint.activate([
            tvMembers.topAnchor.constraint(equalTo: topAnchor),
            tvMembers.leadingAnchor.constraint(equalTo: leadingAnchor),
            tvMembers.trailingAnchor.constraint(equalTo: trailingAnchor),
            tvMembers.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupScreen() {
        setupTableView()
    }
}
