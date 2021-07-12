//
//  TableViewVC.swift
//  Programmatic Tab Bar Controller Example
//
//  Created by Rizwan  Rana on 02/07/2021.
//  Copyright © 2021 Grant Elliott. All rights reserved.
//

import UIKit


    class TableViewVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

        private let myArray: NSArray = ["Martha Craig","Zack Tonight","Eminum", "Akcent"]
        private var myTableView: UITableView!
        let ContactsLbl = CFBodyLabel(text: "Invite People")
        var checked = [Bool]()
        override func viewDidLoad() {
            super.viewDidLoad()

            setupContactsLabel()
            checked = Array(repeating: false, count: myArray.count)
            let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
            let displayWidth: CGFloat = UIScreen.main.bounds.width
            let displayHeight: CGFloat = self.view.frame.height

            myTableView = UITableView(frame: CGRect(x: 0, y: 150, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
            myTableView.dataSource = self
            myTableView.delegate = self
            self.view.addSubview(myTableView)
        }
        private func setupContactsLabel() {
            view.addSubview(ContactsLbl)
            ContactsLbl.translatesAutoresizingMaskIntoConstraints = false
            ContactsLbl.font = RobotoFont.medium.size(18)
            ContactsLbl.textColor = .black
            ContactsLbl.numberOfLines = 1
            ContactsLbl.textAlignment = .left
            NSLayoutConstraint.activate([
                ContactsLbl.topAnchor.constraint(equalTo: logoLbl.bottomAnchor, constant: 30),
                ContactsLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                //logoLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
            ])
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            print("Num: \(indexPath.row)")
//            print("Value: \(myArray[indexPath.row])")
            tableView.deselectRow(at: indexPath, animated: true)

            if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? TableViewCell {
                    if cell.checkMarkImage.image == #imageLiteral(resourceName: "checked") {
                        cell.checkMarkImage.image = #imageLiteral(resourceName: "uncheck")
                        checked[indexPath.row] = false
                    } else {
                        cell.checkMarkImage.image = #imageLiteral(resourceName: "checked")
                        checked[indexPath.row] = true
                    }
                }
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
            
            cell.lblBody.text = "\(myArray[indexPath.row])"
            cell.avatarImage.image = #imageLiteral(resourceName: "image2")
            
           
           
            if checked[indexPath.row] == false{
                cell.checkMarkImage.image = #imageLiteral(resourceName: "uncheck")
               } else if checked[indexPath.row] {
                cell.checkMarkImage.image = #imageLiteral(resourceName: "checked")
               }
        
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
    }
    




