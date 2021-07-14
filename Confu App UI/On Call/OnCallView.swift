//
//  OnCallView.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 14/07/2021.
//

import UIKit

class OnCallView: UIView {
        var OnCallVC: OnCallViewController? {
            didSet {
                micButton.addTarget(OnCallVC, action: #selector(OnCallVC?.micBtnActionTapped), for: .touchUpInside)
                speakerButton.addTarget(OnCallVC, action: #selector(OnCallVC?.speakerBtnActionTapped), for: .touchUpInside)
            }
        }
    let ringingLbl = CFBodyLabel(text: "Ringing")
    let memberNameLbl = CFLargeTitleLabel(text: "Rizwan Members")
    var OnCallCollectionView : UICollectionView!
    var membersCollectionView : UICollectionView!
    var testArray = [1,2, 3]
    var vuMembers = UIView()
    var micButton = CFButton(buttonImage: UIImage(named: "microPhone")!)
    var speakerButton = CFButton(buttonImage: UIImage(named: "speakerIcon")!)
    var vuSeparator = UIView()
    let scanImageView = CFImageView(frame: .zero)
    let scanCodeLbl = CFBodyLabel(text: "Scan the code to join the meeting")
    lazy var svControls = CFStackView(views: [
        micButton,
        speakerButton
    ], axis: .horizontal, spacing: 40)
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupRingingLabel() {
        addSubview(ringingLbl)
        ringingLbl.translatesAutoresizingMaskIntoConstraints = false
        ringingLbl.font = RobotoFont.medium.size(20)
        ringingLbl.textColor = .black
        ringingLbl.numberOfLines = 1
        ringingLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            ringingLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            ringingLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ringingLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
        ])
    }
    
    private func setupOncallCollectionView()
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

            layout.itemSize = CGSize(width: 110, height: 170)
        layout.scrollDirection = .horizontal
       
       OnCallCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    
        OnCallCollectionView.translatesAutoresizingMaskIntoConstraints = false
        OnCallCollectionView.dataSource = self
        OnCallCollectionView.delegate = self
     
        OnCallCollectionView.register(OnCallCollectionViewCell.self, forCellWithReuseIdentifier: "onCall")
        OnCallCollectionView.isScrollEnabled = true
        OnCallCollectionView.backgroundColor = UIColor.white
      
       
        addSubview(OnCallCollectionView)
       // bringSubviewToFront(favoritesCollectionView)
        NSLayoutConstraint.activate([
            OnCallCollectionView.topAnchor.constraint(equalTo: ringingLbl.bottomAnchor, constant: 40),
            OnCallCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            OnCallCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            OnCallCollectionView.heightAnchor.constraint(equalToConstant: 170)

        ])
    }
    private func setupStackView() {
        
        addSubview(svControls)
        svControls.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            svControls.topAnchor.constraint(equalTo: OnCallCollectionView.bottomAnchor, constant: 0),
            svControls.centerXAnchor.constraint(equalTo: OnCallCollectionView.centerXAnchor),
//            svControls.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            svControls.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            svControls.heightAnchor.constraint(equalToConstant: 50),
            svControls.widthAnchor.constraint(equalToConstant: 140)
            
          
        ])
    }
    private func setupMembersView() {
        addSubview(vuMembers)
        
        vuMembers.backgroundColor = .white
        
        vuMembers.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            vuMembers.topAnchor.constraint(equalTo: svControls.bottomAnchor),
            vuMembers.leadingAnchor.constraint(equalTo: leadingAnchor),
            vuMembers.trailingAnchor.constraint(equalTo: trailingAnchor),
            vuMembers.heightAnchor.constraint(equalToConstant: 250)
            
        ])
        vuMembers.addSubview(memberNameLbl)
        memberNameLbl.translatesAutoresizingMaskIntoConstraints = false
        memberNameLbl.font = RobotoFont.bold.size(18)
        memberNameLbl.textColor = .black
        memberNameLbl.numberOfLines = 1
        memberNameLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            memberNameLbl.topAnchor.constraint(equalTo: vuMembers.topAnchor, constant: 20),
            memberNameLbl.leadingAnchor.constraint(equalTo: vuMembers.leadingAnchor, constant: 20),
            memberNameLbl.trailingAnchor.constraint(equalTo: vuMembers.trailingAnchor, constant: -20),
           
        ])
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

            layout.itemSize = CGSize(width: 55, height: 75)
        layout.scrollDirection = .vertical
       
       membersCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    
        membersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        membersCollectionView.dataSource = self
        membersCollectionView.delegate = self
     
        membersCollectionView.register(MyCell.self, forCellWithReuseIdentifier: "members")
        membersCollectionView.isScrollEnabled = true
        membersCollectionView.backgroundColor = UIColor.white
      
       
        vuMembers.addSubview(membersCollectionView)
       // bringSubviewToFront(favoritesCollectionView)
        NSLayoutConstraint.activate([
            membersCollectionView.topAnchor.constraint(equalTo: memberNameLbl.bottomAnchor, constant: 20),
            membersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            membersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            membersCollectionView.heightAnchor.constraint(equalToConstant: 170)

        ])

    }
    private func setupSeparatorView() {
        addSubview(vuSeparator)
        
        vuSeparator.backgroundColor = .lightGray
        
        vuSeparator.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            vuSeparator.topAnchor.constraint(equalTo: vuMembers.bottomAnchor, constant: -10),
            vuSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            vuSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            vuSeparator.heightAnchor.constraint(equalToConstant: 1)
            
        ])
        
    }
    private func setupScanCodeLabel() {
        addSubview(scanCodeLbl)
        scanCodeLbl.translatesAutoresizingMaskIntoConstraints = false
        scanCodeLbl.font = RobotoFont.regular.size(13)
        scanCodeLbl.textColor = .black
        scanCodeLbl.numberOfLines = 1
        scanCodeLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            scanCodeLbl.topAnchor.constraint(equalTo: vuSeparator.bottomAnchor, constant: 10),
            scanCodeLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            scanCodeLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
           
        ])
    }
    private func setupScanImageView() {
        addSubview(scanImageView)
      //  bringSubviewToFront(scanImage)
        scanImageView.image = UIImage(named: "barCode")
        scanImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scanImageView.topAnchor.constraint(equalTo: scanCodeLbl.bottomAnchor, constant: 10),
            scanImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            scanImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            scanImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scanImageView.heightAnchor.constraint(equalToConstant: 65),
            scanImageView.widthAnchor.constraint(equalToConstant: 133)
        ])
    }

    private func setupScreen() {
        
        setupRingingLabel()
        setupOncallCollectionView()
        setupStackView()
        setupMembersView()
        setupSeparatorView()
        setupScanCodeLabel()
        setupScanImageView()
    }

}
extension OnCallView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == membersCollectionView
        {
            return 10
        }
        else
        {
        return testArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == membersCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "members", for: indexPath) as! MyCell
    //        if testArray.count == 2
    //        {
            cell.avatarImage.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
            cell.avatarImage.widthAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
            cell.lblBody.text = "Ali"
            cell.avatarImage.image = UIImage(named: "image3")
            cell.layoutIfNeeded()
            cell.layer.setNeedsLayout()
         //   membersCollectionView.reloadData()
    //        }
    //        else
    //        {
    //            cell.avatarHeight = 80
    //            cell.avatarWidth = 80
    //        }
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onCall", for: indexPath) as! OnCallCollectionViewCell
    //        if testArray.count == 2
    //        {
    //            cell.avatarHeight = 100
    //            cell.avatarWidth = 100
    //        }
    //        else
    //        {
    //            cell.avatarHeight = 80
    //            cell.avatarWidth = 80
    //        }
            return cell
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == OnCallCollectionView
        {
            let totalCellWidth = 110 * collectionView.numberOfItems(inSection: 0)
            let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)

            let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset

            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)

       }
        else
        {
            return UIEdgeInsets()
        }
       
    }
    

}
