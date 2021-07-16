//
//  InviteOncallView.swift
//  Confu App UI
//
//  Created by Rizwan Sultan on 16/07/2021.
//

import UIKit

class InviteOncallView: UIView , UICollectionViewDelegate, UICollectionViewDataSource{
    let inviteLbl = CFBodyLabel(text: "Invite people")
    var searchTextField = CFTextField(placeholderText: "Search", leftImage: #imageLiteral(resourceName: "search"))
    var contactsCollectionView : UICollectionView!
    var separatorView = UIView()
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
    var backgroundView = UIView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        
        
        setupScreen()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupBackgroundView()
    {
        addSubview(backgroundView)
        backgroundView.layer.cornerRadius = 30
        backgroundView.clipsToBounds = true
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .clear
        
       // backgroundView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
       
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
                                     backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor), backgroundView.bottomAnchor
                                        .constraint(equalTo: bottomAnchor)
        ])
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.85
        backgroundView.addSubview(blurEffectView)
    }
    
    
    func setupInviteLabel()  {
        backgroundView.addSubview(inviteLbl)
        inviteLbl.translatesAutoresizingMaskIntoConstraints = false
        inviteLbl.textAlignment = .center
        inviteLbl.textColor = UIColor.black
        NSLayoutConstraint.activate([inviteLbl.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
                                     inviteLbl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        NSLayoutConstraint.activate([separatorView.topAnchor.constraint(equalTo: inviteLbl.bottomAnchor, constant: 10),
                                     separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), separatorView.heightAnchor
                                        .constraint(equalToConstant: 1)
        ])
    }
    
    
    private func setupSearchTextField(){
        backgroundView.addSubview(searchTextField)
      //  searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.borderStyle = .none
        searchTextField.font = RobotoFont.medium.size(18)
        searchTextField.textColor = .black
        searchTextField.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        searchTextField.layer.cornerRadius = 10.0
        searchTextField.tintColor = .black
        searchTextField.clipsToBounds = true
        searchTextField.textAlignment = .left
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 35)
            //logoLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }
    private func setUpContactCollectionView()
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.itemSize = CGSize(width: 70, height: 90)
        
        contactsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        backgroundView.addSubview(contactsCollectionView)
        contactsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contactsCollectionView.dataSource = self
        contactsCollectionView.delegate = self
        contactsCollectionView.register(callContactsCell.self, forCellWithReuseIdentifier: "MyCell")
        
        contactsCollectionView.backgroundColor = UIColor.clear
        
        NSLayoutConstraint.activate([
            contactsCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30),
            contactsCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            contactsCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            contactsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
       
    }
    func setupScreen()
    {
        setupBackgroundView()
        setupInviteLabel()
        setupSearchTextField()
        setUpContactCollectionView()
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
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
