//
//  OnCallViewController.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 14/07/2021.
//

import UIKit

class OnCallViewController: UIViewController {

    let onCallView = OnCallView()
    var isSpeaker = false
    var isMicroPhone = false
    override func loadView() {
        super.loadView()

        view = onCallView
        onCallView.OnCallVC = self
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
//       let viewController3 = TabbarController().viewControllers[2]
//        viewController3.tabBarItem.image = UIImage(named: "callTab")
            //self.tabBarController?.viewControllers?[2]
//        {
//           viewController3.tabBarItem.image = UIImage(named: "your_image_name")
//
//        }

        // Do any additional setup after loading the view.
    }
    @objc func micBtnActionTapped(sender: UIButton)
    {
      
        
        isMicroPhone = !isMicroPhone
       if isMicroPhone
       {
        onCallView.micButton.setImage(UIImage(named: "micChecked"), for: .normal)
       }
        else
       {
        onCallView.micButton.setImage(UIImage(named: "microPhone"), for: .normal)
       }
       
    }
    @objc func speakerBtnActionTapped(sender: UIButton)
    {
        isSpeaker = !isSpeaker
       if isSpeaker
       {
        onCallView.speakerButton.setImage(UIImage(named: "speakerChecked"), for: .normal)
       }
        else
       {
        onCallView.speakerButton.setImage(UIImage(named: "speakerIcon"), for: .normal)
       }
      
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
