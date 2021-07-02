//
//  TableViewVC.swift
//  Programmatic Tab Bar Controller Example
//
//  Created by Rizwan  Rana on 02/07/2021.
//  Copyright © 2021 Grant Elliott. All rights reserved.
//

import UIKit


    class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

        private let myArray: NSArray = ["First","Second","Third"]
        private var myTableView: UITableView!

        override func viewDidLoad() {
            super.viewDidLoad()

            let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
            let displayWidth: CGFloat = self.view.frame.width
            let displayHeight: CGFloat = self.view.frame.height

            myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
            myTableView.dataSource = self
            myTableView.delegate = self
            self.view.addSubview(myTableView)
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Num: \(indexPath.row)")
            print("Value: \(myArray[indexPath.row])")
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath)
            cell.textLabel!.text = "\(myArray[indexPath.row])"
            return cell
        }
    }
    




