//
//  BestPracticesView.swift
//  ConfuNewDesign
//
//  Created by Shayan Zahid on 11/02/2020.
//  Copyright © 2020 Shayan Zahid. All rights reserved.
//

import UIKit

//class BestPracticesView: UIView {
//    var bestPracticesVC: BestPracticesVC? {
//        didSet {
////            callToAction.addTarget(bestPracticesVC, action: #selector(BestPracticesVC.actionButtonTapped), for: .touchUpInside)
//        }
//    }
//
//    var mainCaptionFont = FontBook.mainHeadline.font
//    var secondaryCaptionFont = FontBook.subHeadline.font
//
//    lazy var mainCaption = CFCaption(labelText: Captions.bpViewMainCaption, labelFont: mainCaptionFont)
//    lazy var secondaryCaption = CFCaption(labelText: Captions.bpViewSecondaryCaption, labelFont: secondaryCaptionFont)
//
//    var backButton = CFButton(buttonImage: #imageLiteral(resourceName: "back-arrow-icon"))
//
//    var bestPractices =  CFBestPracticeStack()
//
//     var callToAction = CFButton(buttonText: "Got it")
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .systemBackground
//
//        bestPractices.bestPracticesView = self
//
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    @objc func titleButtonTapped(sender: Any) {
//        let button: UIButton = sender as! UIButton
//
//        let practice1 = bestPractices.practiceView1
//        let practice2 = bestPractices.practiceView2
//        let practice3 = bestPractices.practiceView3
//        let practice4 = bestPractices.practiceView4
//
//        if button.currentTitle == Captions.bpBulletTitle[0] {
//            practice1!.descriptionCaption?.isHidden =  !practice1!.descriptionCaption!.isHidden
//            practice1?.titleButton?.setImage(UIImage(systemName: ((practice1?.descriptionCaption!.isHidden)!) ? "chevron.down" : "chevron.up"), for: .normal)
//        } else if button.currentTitle == Captions.bpBulletTitle[1] {
//            practice2!.descriptionCaption?.isHidden =  !practice2!.descriptionCaption!.isHidden
//            practice2?.titleButton?.setImage(UIImage(systemName: ((practice2?.descriptionCaption!.isHidden)!) ? "chevron.down" : "chevron.up"), for: .normal)
//        } else if button.currentTitle == Captions.bpBulletTitle[2] {
//            practice3!.descriptionCaption?.isHidden =  !practice3!.descriptionCaption!.isHidden
//            practice3?.titleButton?.setImage(UIImage(systemName: ((practice3?.descriptionCaption!.isHidden)!) ? "chevron.down" : "chevron.up"), for: .normal)
//        } else if button.currentTitle == Captions.bpBulletTitle[3] {
//            practice4!.descriptionCaption?.isHidden =  !practice4!.descriptionCaption!.isHidden
//            practice4?.titleButton?.setImage(UIImage(systemName: ((practice4?.descriptionCaption!.isHidden)!) ? "chevron.down" : "chevron.up"), for: .normal)
//        }
//    }
//
//    private func setupMainCaption() {
//        addSubview(mainCaption)
//
//        NSLayoutConstraint.activate([
//            mainCaption.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0),
//            mainCaption.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
//            mainCaption.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
//        ])
//    }
//
//    private func setupSecondaryCaption() {
//        addSubview(secondaryCaption)
//
//        NSLayoutConstraint.activate([
//            secondaryCaption.topAnchor.constraint(equalTo: mainCaption.bottomAnchor, constant: 16.0),
//            secondaryCaption.leadingAnchor.constraint(equalTo: mainCaption.leadingAnchor),
//            secondaryCaption.trailingAnchor.constraint(equalTo: mainCaption.trailingAnchor)
//        ])
//    }
//
//    private func setupBestpractices() {
//        addSubview(bestPractices)
//
//        NSLayoutConstraint.activate([
//            bestPractices.topAnchor.constraint(equalTo: secondaryCaption.bottomAnchor, constant: 30),
//            bestPractices.leadingAnchor.constraint(equalTo: mainCaption.leadingAnchor),
//            bestPractices.trailingAnchor.constraint(equalTo: mainCaption.trailingAnchor)
//        ])
//    }
//
//    private func setupCallToAction() {
//        addSubview(callToAction)
//
//        NSLayoutConstraint.activate([
//            callToAction.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
//            callToAction.leadingAnchor.constraint(equalTo: mainCaption.leadingAnchor),
//            callToAction.trailingAnchor.constraint(equalTo: mainCaption.trailingAnchor),
//            callToAction.heightAnchor.constraint(equalToConstant: 60.0)
//        ])
//    }
//
//    private func setupViews() {
//        setupMainCaption()
//        setupSecondaryCaption()
//        setupBestpractices()
//        setupCallToAction()
//    }
//}

class BestPracticesView: UIView {
    var bestPracticesVC: BestPracticesVC? {
        didSet {
            nextButton.addTarget(bestPracticesVC, action: #selector(BestPracticesVC.nextTapped), for: .touchUpInside)
            skipButton.addTarget(bestPracticesVC, action: #selector(BestPracticesVC.skipTapped), for: .touchUpInside)
        }
    }

    let scrollView = UIScrollView()

    let skipButton = UIButton()
    let pageControl = UIPageControl()
    let nextButton = UIButton()

    let slide1 = BestPracticeSlide(
        largeTitle: "5G \nNetwork",
        smallTitle: "Please connect to a local 5Ghz wireless to ensure a good quality experience. The network may also be a hotspot created by the person initiating the call."
    )

    let slide2 = BestPracticeSlide(
        largeTitle: "Keep your \nphones away",
        smallTitle: "Please keep your phone infront of yourself and place it 10 inches away from your face."
    )

    let slide3 = BestPracticeSlide(
        largeTitle: "Drop your \nphone volume",
        smallTitle: "Please do not turn up the volume to the max as the collective audio generated may get too loud."
    )

    let slide4 = BestPracticeSlide(
        largeTitle: "Schedule \nmeeting before",
        smallTitle: "Please set a meeting time atleast 5 minutes ahead from the current time."
    )

    let slide5 = BestPracticeSlide(
        largeTitle: "Distance \nin phones",
        smallTitle: "Please keep a distance from other phones in the room."
    )

    lazy var slides = [
        slide1,
        slide2,
        slide3,
        slide4,
        slide5
    ]

    override func layoutSubviews() {
        setupScrollViewSlides()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        setupScreen()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupScrollView() {
        addSubview(scrollView)

        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupSkipButton() {
        addSubview(skipButton)

        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitle("Skip Intro", for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
        skipButton.titleLabel?.font = RobotoFont.medium.size(14)

        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            skipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40)
        ])
    }

    private func setupPageControl() {
        addSubview(pageControl)

        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0

        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40)
        ])
    }

    private func setupNextButton() {
        addSubview(nextButton)

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .white
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.layer.cornerRadius = 30
        nextButton.tintColor = .white

        NSLayoutConstraint.activate([
            nextButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }

    func setupScrollViewSlides() {
      scrollView.contentSize = CGSize(width: bounds.width * CGFloat(slides.count), height: 200)
      for i in 0..<slides.count {
        slides[i].frame = CGRect(x: bounds.width * CGFloat(i) + 50, y: 200, width: bounds.width - 100, height: bounds.height - 400)
        scrollView.addSubview(slides[i])
      }
    }

    private func setupScreen() {
        setupScrollView()
        setupSkipButton()
        setupPageControl()
        setupNextButton()
    }
}
