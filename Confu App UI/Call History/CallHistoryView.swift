//
//  CallHistoryView.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 09/07/2021.
//

import UIKit

class CallHistoryView: UIView {

    var CallHistoryVC: CallHistoryVC? {
    didSet {
                    
            }
    }
    var uvHeader = UIView()
    var uvRecent = UIView()
    let emptyImage = CFImageView(frame: .zero)
    let scrollView = UIScrollView()
    let contentView = UIView()
    var buttonBottomConstraint = NSLayoutConstraint()
    let padding: CGFloat = 20
    let secondaryPadding: CGFloat = 40
    let emptyLbl = CFBodyLabel(text: StaticLabels.pnNoMeetingFound.rawValue)
    let emptySubLbl = CFBodyLabel(text: StaticLabels.pnInstructionText.rawValue)
    let favoritesLbl = CFBodyLabel(text: "Favorites")
    let recentLbl = CFBodyLabel(text: "Recents")
    var favoritesCollectionView : UICollectionView!
    var recentTableView : UITableView!
    var constraintVariable: NSLayoutConstraint!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        
        
        emptyImage.isHidden = true
        if contentOffset >= 100
        {
            if uvHeader.isHidden == true
            {
                return
            }
            else
            {
               
                self.favoritesCollectionView.alpha = 1
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
                    self.favoritesCollectionView.alpha = 0
                    self.constraintVariable.constant = 0
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                    
                }
            )
            }
     }
        
        else
        {
           
            if self.constraintVariable.constant == 160
            {
                return
            }
            else
            {
                self.favoritesCollectionView.alpha = 0
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn], animations: {
                    self.favoritesCollectionView.alpha = 1
                    self.constraintVariable.constant = 160
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                    
                }

            )}
    
        }

    }
    

    private func setupEmptyImageView() {
        addSubview(emptyImage)
    
        emptyImage.image = UIImage(named: "emptyContacts")
        emptyImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyImage.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            emptyImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
           // emptyImage.centerYAnchor.constraint(equalTo: centerYAnchor),
           // emptyImage.bottomAnchor.constraint(equalTo: uvHeader.bottomAnchor, constant: 40),
            emptyImage.heightAnchor.constraint(equalToConstant: 230),
            emptyImage.widthAnchor.constraint(equalToConstant: 230)
        ])
    }
    private func setupEmptyLabel() {
        addSubview(emptyLbl)
        emptyLbl.translatesAutoresizingMaskIntoConstraints = false
        emptyLbl.font = RobotoFont.medium.size(20)
        emptyLbl.textColor = .black
        emptyLbl.numberOfLines = 1
        emptyLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            emptyLbl.topAnchor.constraint(equalTo: emptyImage.bottomAnchor, constant: 30),
            emptyLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptyLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
        ])
    }
    private func setupSubEmptyLabel() {
        addSubview(emptySubLbl)
        emptySubLbl.translatesAutoresizingMaskIntoConstraints = false
        emptySubLbl.font = RobotoFont.regular.size(14)
        emptySubLbl.textColor = .black
        emptySubLbl.numberOfLines = 2
        emptySubLbl.textAlignment = .center
        NSLayoutConstraint.activate([
            emptySubLbl.topAnchor.constraint(equalTo: emptyLbl.bottomAnchor, constant: 10),
            emptySubLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptySubLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
        ])
    }
    private func setupHeaderView() {
        addSubview(uvHeader)
        
        uvHeader.backgroundColor = .white
        
        uvHeader.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            uvHeader.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            uvHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            uvHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            uvHeader.heightAnchor.constraint(equalToConstant: 160)
            
        ])
        constraintVariable = uvHeader.heightAnchor.constraint(equalToConstant: 160)
        constraintVariable.isActive = true
    }
    private func setupFavouriteLabel() {
        addSubview(favoritesLbl)
        favoritesLbl.translatesAutoresizingMaskIntoConstraints = false
        favoritesLbl.font = RobotoFont.medium.size(20)
        favoritesLbl.textColor = .black
        favoritesLbl.numberOfLines = 1
        favoritesLbl.textAlignment = .left
        NSLayoutConstraint.activate([
            favoritesLbl.topAnchor.constraint(equalTo: uvHeader.topAnchor, constant: 10),
            favoritesLbl.leadingAnchor.constraint(equalTo: uvHeader.leadingAnchor, constant: 20),
            favoritesLbl.trailingAnchor.constraint(equalTo: uvHeader.trailingAnchor, constant: -20),
           
        ])
    }
    private func setupRecentView() {
        addSubview(uvRecent)
        
        uvRecent.backgroundColor = .white
        
        uvRecent.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            uvRecent.topAnchor.constraint(equalTo: uvHeader.bottomAnchor),
            uvRecent.leadingAnchor.constraint(equalTo: leadingAnchor),
            uvRecent.trailingAnchor.constraint(equalTo: trailingAnchor),
            uvRecent.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupRecentsLabel() {
        addSubview(recentLbl)
        recentLbl.translatesAutoresizingMaskIntoConstraints = false
        recentLbl.font = RobotoFont.medium.size(20)
        recentLbl.textColor = .black
        recentLbl.numberOfLines = 1
        recentLbl.textAlignment = .left
        NSLayoutConstraint.activate([
            recentLbl.topAnchor.constraint(equalTo: uvRecent.topAnchor, constant: 0),
            recentLbl.leadingAnchor.constraint(equalTo: uvRecent.leadingAnchor, constant: 20),
            recentLbl.trailingAnchor.constraint(equalTo: uvRecent.trailingAnchor, constant: -20),
            recentLbl.bottomAnchor.constraint(equalTo: uvRecent.bottomAnchor)
            
        ])
    }
    private func setUpFavouriteCollectionView()
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.itemSize = CGSize(width: 70, height: 80)
        layout.scrollDirection = .horizontal
       
       favoritesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
      //  favoritesCollectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: frame.width, height: frame.height / 1.85), collectionViewLayout: layout)
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
        favoritesCollectionView.reloadData()
        favoritesCollectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        favoritesCollectionView.isScrollEnabled = true
        favoritesCollectionView.backgroundColor = UIColor.white
        
      
       
        addSubview(favoritesCollectionView)
       // bringSubviewToFront(favoritesCollectionView)
        NSLayoutConstraint.activate([
            favoritesCollectionView.topAnchor.constraint(equalTo: favoritesLbl.bottomAnchor, constant: 0),
            favoritesCollectionView.leadingAnchor.constraint(equalTo: uvHeader.leadingAnchor, constant: 20),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: uvHeader.trailingAnchor, constant: -20),
            favoritesCollectionView.heightAnchor.constraint(equalToConstant: 120)

        ])
    }
    
    private func setUpRecentTableView()
    {

        recentTableView = UITableView(frame: CGRect.zero)
        recentTableView.translatesAutoresizingMaskIntoConstraints = false
        recentTableView.dataSource = self
        recentTableView.delegate = self
        recentTableView.reloadData()
        recentTableView.separatorStyle = .none
        recentTableView.register(recentTableViewCell.self, forCellReuseIdentifier: "recent")
        recentTableView.isScrollEnabled = true
        recentTableView.backgroundColor = UIColor.white
        
      
       
        addSubview(recentTableView)
        NSLayoutConstraint.activate([
            recentTableView.topAnchor.constraint(equalTo: uvRecent.bottomAnchor, constant: 0),
            recentTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recentTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recentTableView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    
    
    private func setupScreen() {
        setupEmptyImageView()
        setupEmptyLabel()
        setupSubEmptyLabel()
        setupHeaderView()
        setupFavouriteLabel()
        setUpFavouriteCollectionView()
        setupRecentView()
        setupRecentsLabel()
        setUpRecentTableView()
    }

}
extension CallHistoryView:  UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        favCell.lblBody.text = "Rizwan"
        favCell.avatarImage.image = UIImage(named: "image1")
    
        return favCell
    }
}

extension CallHistoryView: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recent") as! recentTableViewCell
        cell.selectionStyle = .none
        if indexPath.row == 1 || indexPath.row == 5 || indexPath.row == 10
        {
            cell.groupImages.isHidden = false
            cell.noOfPersonLbl.isHidden = false
        }
        else
        {
            cell.groupImages.isHidden = true
            cell.noOfPersonLbl.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let navToCall = OnCallViewController()
        let tabBarVC = CallTabbarController()
//        onCallVC.modalPresentationStyle = .popover
//        onCallVC.hidesBottomBarWhenPushed = false
//        CallHistoryVC?.present(onCallVC, animated: true, completion: nil)
        tabBarVC.modalPresentationStyle = .fullScreen
        CallHistoryVC?.present(tabBarVC, animated: true, completion: nil)
    }
}
