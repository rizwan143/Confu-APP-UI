//
//  CallHistoryVC.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 09/07/2021.
//

import UIKit

class CallHistoryVC: UIViewController {
    let callHistoryView = CallHistoryView()
    
    
    override func loadView() {
        super.loadView()

        view = callHistoryView
        callHistoryView.CallHistoryVC = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

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
