//
//  InviteOncallVC.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 16/07/2021.
//

import UIKit

class InviteOncallVC: UIViewController {
    let inviteOncallView = InviteOncallView()
    override func loadView() {
        super.loadView()

        view = inviteOncallView
        inviteOncallView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
