//
//  CFAvatarImageView.swift
//  NewProgrammaticUI
//
//  Created by Shayan on 25/04/2020.
//  Copyright © 2020 Confu002. All rights reserved.
//

import UIKit

class CFAvatarImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.masksToBounds = true
        //        image = #imageLiteral(resourceName: "temp-image")
        contentMode = .scaleAspectFill
    }
}

//extension UIImageView: ImageProtocol {
//    func downloadImage(of user: UserModel) {
//        self.image = imageWith(name: user.cloudName)
//        guard let url = user.picture?.url else {
//            return
//        }
//        
//        let cacheKey = NSString(string: url.absoluteString)
//        
//        if let image = CacheHelper.shared.cache.object(forKey: cacheKey) {
//            self.image = image
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let self = self else { return }
//            
//            if error != nil { return }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
//            
//            guard let data = data,
//                let image = UIImage(data: data) else {
//                    return
//            }
//            
//            CacheHelper.shared.cache.setObject(image, forKey: cacheKey)
//            
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        
//        task.resume()
//    }
//}
