//
//  PageCell.swift
//  Confu App UI
//
//  Created by Rizwan  Rana on 06/07/2021.
//

import UIKit

class PageCell: UICollectionViewCell {
  var index = 0
    var page: Page? {
        didSet {

            guard let unwrappedPage = page else { return }
            
            pagesImageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText = unwrappedPage.headerText
      
            descriptionTextView.attributedText = attributedText

            descriptionTextView.textAlignment = .justified
            contentView.bringSubviewToFront(pagesImageView)
        }
    }
    
    private let pagesImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "armsLength"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
//        let attributedText = NSMutableAttributedString(string: "Keep phone at arm’s length", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
//
//        attributedText.append(NSAttributedString(string: "\n\n\nPlease keep your smartphone infront of yourself and away from other participating phones to ensure clear audio.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
//
//        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.bringSubviewToFront(pagesImageView)
        topImageContainerView.addSubview(pagesImageView)
        pagesImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        pagesImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        pagesImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: -120).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
