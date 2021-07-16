//
//  CallContactsVC.swift

//  Created by Rizwan  Rana on 02/07/2021.
//  Copyright © 2021 Grant Elliott. All rights reserved.
//

import UIKit


    class CallContactsVC: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
        var scheduleCallBtn = CFButton(buttonText: "Schedule Call")
        var inviteToConfuBtn = CFButton(buttonText: "+ Invite people to Confu")
        var searchTextField = CFTextField(placeholderText: "Search", leftImage: #imageLiteral(resourceName: "search"))
        let ContactsLbl = CFBodyLabel(text: "Contacts")
        var contactsCollectionView : UICollectionView!
        override func viewDidLoad() {
            super.viewDidLoad()
            setupScreen()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
           
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 30
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! callContactsCell
            myCell.lblBody.text = "Rizwan"
            myCell.avatarImage.image = UIImage(named: "image1")
        
            return myCell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        {
            print("User tapped on item \(indexPath.row)")
        }
  
        private func setupSearchTextField(){
            view.addSubview(searchTextField)
          //  searchTextField.translatesAutoresizingMaskIntoConstraints = false
            searchTextField.borderStyle = .none
            searchTextField.font = RobotoFont.medium.size(18)
            searchTextField.textColor = .black
            searchTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            searchTextField.layer.cornerRadius = 15.0
            searchTextField.tintColor = .black
            searchTextField.clipsToBounds = true
            searchTextField.textAlignment = .left
            NSLayoutConstraint.activate([
                searchTextField.topAnchor.constraint(equalTo: logoLbl.bottomAnchor, constant: 20),
                searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                searchTextField.heightAnchor.constraint(equalToConstant: 35)
                //logoLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
            ])
        }
        
        private func setupContactsLabel() {
            view.addSubview(ContactsLbl)
            ContactsLbl.translatesAutoresizingMaskIntoConstraints = false
            ContactsLbl.font = RobotoFont.medium.size(18)
            ContactsLbl.textColor = .black
            ContactsLbl.numberOfLines = 1
            ContactsLbl.textAlignment = .left
            NSLayoutConstraint.activate([
                ContactsLbl.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
                ContactsLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                //logoLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
            ])
        }
        private func setupScheduleCallBtn() {
            view.addSubview(scheduleCallBtn)
            scheduleCallBtn.translatesAutoresizingMaskIntoConstraints = false
            scheduleCallBtn.backgroundColor = .clear
            scheduleCallBtn.setTitleColor(#colorLiteral(red: 0.03921568627, green: 0.7137254902, blue: 0.6549019608, alpha: 1), for: .normal)
            NSLayoutConstraint.activate([
                scheduleCallBtn.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
                scheduleCallBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
               
            ])
        }
        private func setUpContactCollectionView()
        {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 100, right: 15)
            layout.itemSize = CGSize(width: view.frame.width/5, height: 100)

            contactsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: view.frame.height / 1.85), collectionViewLayout: layout)
            contactsCollectionView.dataSource = self
            contactsCollectionView.delegate = self
            contactsCollectionView.register(callContactsCell.self, forCellWithReuseIdentifier: "MyCell")
            
            contactsCollectionView.backgroundColor = UIColor.white
            self.view.addSubview(contactsCollectionView)
        }
        private func setupInviteBtn() {
            view.addSubview(inviteToConfuBtn)
            inviteToConfuBtn.translatesAutoresizingMaskIntoConstraints = false
            inviteToConfuBtn.backgroundColor = .clear
            inviteToConfuBtn.setTitleColor(#colorLiteral(red: 0.03921568627, green: 0.7137254902, blue: 0.6549019608, alpha: 1), for: .normal)
            inviteToConfuBtn.isUserInteractionEnabled = true
            inviteToConfuBtn.addTarget(self, action: #selector(inviteActionTapped), for: .touchUpInside)
            NSLayoutConstraint.activate([
                inviteToConfuBtn.topAnchor.constraint(equalTo: contactsCollectionView.bottomAnchor, constant: 20),
                inviteToConfuBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               
            ])
        }
        @objc func inviteActionTapped()
        {
            let navigationState = NavigationStates.shared
            navigationState.setState(state: .invitePeople)
            print("Invite BUTTON TAPPED")
//            let inviteViewController = InviteConfuViewController()
//            inviteViewController.modalPresentationStyle = .overCurrentContext
//            inviteViewController.hidesBottomBarWhenPushed = false
//                navigationController?.pushViewController(inviteViewController, animated: true)
        }
        private func setupScreen() {
            self.view.backgroundColor = .white
            setupSearchTextField()
            setupContactsLabel()
            setupScheduleCallBtn()
            setUpContactCollectionView()
            setupInviteBtn()
           
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    }


