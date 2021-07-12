//
//  CallHistoryVC.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 09/07/2021.
//

import UIKit

class CallHistoryVC: BaseViewController {
    let callHistoryView = CallHistoryView()
    
    
    override func loadView() {
        super.loadView()

        view = callHistoryView
        callHistoryView.CallHistoryVC = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        callHistoryView.favoritesCollectionView.dataSource = self
//        callHistoryView.favoritesCollectionView.delegate = self
        self.navigationController?.isNavigationBarHidden = true
      //  addTopView()

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
//extension CallHistoryVC: UICollectionViewDelegate, UICollectionViewDataSource
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let favCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
//        favCell.lblBody.text = "Rizwan"
//        favCell.avatarImage.image = UIImage(named: "image1")
//
//        return favCell
//    }
//}
