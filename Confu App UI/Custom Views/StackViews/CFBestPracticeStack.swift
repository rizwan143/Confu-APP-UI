////
////  CFBestPracticeStack.swift
////  ConfuNewDesign
////
////  Created by Shayan on 02/04/2020.
////  Copyright © 2020 Shayan Zahid. All rights reserved.
////
//
//import UIKit
//
//class CFBestPracticeStack: UIStackView {
//    var bestPracticesView: BestPracticesView? {
//        didSet{
////            practiceView1!.titleButton!.addTarget(bestPracticesView, action: #selector(BestPracticesView.titleButtonTapped(sender:)), for: .touchUpInside)
////            practiceView2!.titleButton!.addTarget(bestPracticesView, action: #selector(BestPracticesView.titleButtonTapped(sender:)), for: .touchUpInside)
////            practiceView3!.titleButton!.addTarget(bestPracticesView, action: #selector(BestPracticesView.titleButtonTapped(sender:)), for: .touchUpInside)
////            practiceView4!.titleButton!.addTarget(bestPracticesView, action: #selector(BestPracticesView.titleButtonTapped(sender:)), for: .touchUpInside)
//        }
//    }
//    
//    var practiceView1: CFBestPracticeItem?
//    var practiceView2: CFBestPracticeItem?
//    var practiceView3: CFBestPracticeItem?
//    var practiceView4: CFBestPracticeItem?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        translatesAutoresizingMaskIntoConstraints = false
//        isUserInteractionEnabled = true
//        axis = .vertical
//        spacing = 10
//        
//        practiceView1 = CFBestPracticeItem()
//        practiceView2 = CFBestPracticeItem()
//        practiceView3 = CFBestPracticeItem()
//        practiceView4 = CFBestPracticeItem()
//        
//        bestPractice1()
//        bestPractice2()
//        bestPractice3()
//        bestPractice4()
//    }
//    
//    private func setupParentView() {
//        NSLayoutConstraint.activate([
//            leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
//        ])
//    }
//    
//    private func bestPractice1() {
//        practiceView1?.titleButton?.setTitle(Captions.bpBulletTitle[0], for: .normal)
//        addArrangedSubview(practiceView1!)
//    }
//    
//    private func bestPractice2() {
//        practiceView2?.titleButton?.setTitle(Captions.bpBulletTitle[1], for: .normal)
//        addArrangedSubview(practiceView2!)
//    }
//    
//    private func bestPractice3() {
//        practiceView3?.titleButton?.setTitle(Captions.bpBulletTitle[2], for: .normal)
//        addArrangedSubview(practiceView3!)
//    }
//    
//    private func bestPractice4() {
//           practiceView4?.titleButton?.setTitle(Captions.bpBulletTitle[3], for: .normal)
//           addArrangedSubview(practiceView4!)
//       }
//    
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
