//
//  ViewController.swift
//  VFL
//
//  Created by Seunghun Yang on 2021/03/03.
//

import UIKit

class ViewController: UIViewController {
    
    let appleImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "apple"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let appLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let swiftImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "swift"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Swift"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift는 macOS, iOS, iPadOS, watchOS, tvOS앱을 개발하기 위한 최적의 언어입니다."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(appleImageView)
        view.addSubview(appLabel)
        view.addSubview(skipButton)
        view.addSubview(swiftImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(summaryLabel)
        view.addSubview(pageControl)
        
        swiftImageView.isHidden = true
        welcomeLabel.isHidden = true
        summaryLabel.isHidden = true
        pageControl.isHidden = true
        
        let views: [String: Any] = [
            "appleImageView": appleImageView,
            "appLabel": appLabel,
            "skipButton": skipButton
        ]

        var allConstraints: [NSLayoutConstraint] = []

        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-50-[appleImageView(30)]",
            metrics: nil,
            views: views
        )
        allConstraints += iconVerticalConstraints

        let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-55-[appLabel]",
            metrics: nil,
            views: views
        )
        allConstraints += nameLabelVerticalConstraints

        let skipButtonVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-50-[skipButton]",
            metrics: nil,
            views: views
        )
        allConstraints += skipButtonVerticalConstraints

        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[appleImageView(30)]-[appLabel]-[skipButton]-15-|",
            metrics: nil,
            views: views
        )
        allConstraints += topRowHorizontalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
    }
}

