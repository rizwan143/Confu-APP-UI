//
//  MemberListVC.swift
//  Confu
//
//  Created by Waleed Khan on 14/07/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

class MemberListVC: UIViewController {
    
    let memberListView = MembersListView()
    
    override func loadView() {
        super.loadView()
        view = memberListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberListView.tvMembers.dataSource = self
        
    }
}

extension MemberListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CallMemberCell.reuseID, for: indexPath) as! CallMemberCell
        if indexPath.row < 3 {
            cell.uvUserView.svAcceptReject.isHidden = false
            cell.uvUserView.svMessageAndMicrophone.isHidden = true
        }
        else {
            cell.uvUserView.svAcceptReject.isHidden = true
            cell.uvUserView.svMessageAndMicrophone.isHidden = false
        }
        return cell
    }
    
    
}

