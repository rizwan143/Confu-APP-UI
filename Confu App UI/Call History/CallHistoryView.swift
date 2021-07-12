//
//  CallHistoryView.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 09/07/2021.
//

import UIKit

class CallHistoryView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        favCell.lblBody.text = "Rizwan"
        favCell.avatarImage.image = UIImage(named: "image1")
    
        return favCell
    }
    
    var CallHistoryVC: CallHistoryVC? {
                didSet {
                    
                }
            }
    var uvHeader = UIView()
    
    let emptyImage = CFImageView(frame: .zero)
    let scrollView = UIScrollView()
    let contentView = UIView()
    var buttonBottomConstraint = NSLayoutConstraint()
    let padding: CGFloat = 20
    let secondaryPadding: CGFloat = 40
    let emptyLbl = CFBodyLabel(text: StaticLabels.pnNoMeetingFound.rawValue)
    let emptySubLbl = CFBodyLabel(text: StaticLabels.pnInstructionText.rawValue)
    let favoritesLbl = CFBodyLabel(text: "Favorites")
    var favoritesCollectionView : UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            uvHeader.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    private func setupFavouriteLabel() {
        addSubview(favoritesLbl)
        favoritesLbl.translatesAutoresizingMaskIntoConstraints = false
        favoritesLbl.font = RobotoFont.medium.size(20)
        favoritesLbl.textColor = .black
        favoritesLbl.numberOfLines = 1
        favoritesLbl.textAlignment = .left
        NSLayoutConstraint.activate([
            favoritesLbl.topAnchor.constraint(equalTo: uvHeader.topAnchor, constant: 20),
            favoritesLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            favoritesLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
        ])
    }
    private func setUpFavouriteCollectionView()
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.itemSize = CGSize(width: 70, height: 100)
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
            favoritesCollectionView.topAnchor.constraint(equalTo: favoritesLbl.bottomAnchor, constant: 20),
            favoritesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            favoritesCollectionView.heightAnchor.constraint(equalToConstant: 150)

        ])
    }
    
    
    private func setupScreen() {
        setupEmptyImageView()
        setupEmptyLabel()
        setupSubEmptyLabel()
        setupHeaderView()
        setupFavouriteLabel()
        setUpFavouriteCollectionView()
    }

}
