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
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift는 macOS, iOS, iPadOS, watchOS, tvOS앱을 개발하기 위한 최적의 언어입니다."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.orange
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
        
        let views: [String: Any] = [
            "appleImageView": appleImageView,
            "appLabel": appLabel,
            "skipButton": skipButton,
            "swiftImageView": swiftImageView,
            "welcomeLabel": welcomeLabel,
            "summaryLabel": summaryLabel,
            "pageControl": pageControl
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
        
        let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[appleImageView]-10-[swiftImageView]",
            metrics: nil,
            views: views
        )
        allConstraints += iconToImageVerticalConstraints
        
        let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[swiftImageView(500)]-10-[welcomeLabel]",
            metrics: nil,
            views: views
        )
        allConstraints += imageToWelcomeVerticalConstraints
        
        let welcomeHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[welcomeLabel]-15-|",
            metrics: nil,
            views: views
        )
        allConstraints += welcomeHorizontalConstraints
        
        let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]",
            metrics: nil,
            views: views
        )
        allConstraints += summaryLabelVerticalConstraints
        
        let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[summaryLabel]-15-|",
            metrics: nil,
            views: views
        )
        allConstraints += summaryHorizontalConstraints
        
        let summaryToPageVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[summaryLabel]-15-[pageControl(9)]-15-|",
            metrics: nil,
            views: views
        )
        allConstraints += summaryToPageVerticalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
    }
}

