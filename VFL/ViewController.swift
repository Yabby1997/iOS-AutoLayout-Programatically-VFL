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
    
    private enum Metrics {
        static let padding: CGFloat = 15.0
        static let iconImageViewWidth: CGFloat = 30.0
    }
    
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
        
        let metrics = [
          "horizontalPadding": Metrics.padding,
          "iconImageViewWidth": Metrics.iconImageViewWidth
        ]
        
        var allConstraints: [NSLayoutConstraint] = []

        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-50-[appleImageView(iconImageViewWidth)]",
            metrics: metrics,
            views: views
        )
        allConstraints += iconVerticalConstraints

        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-horizontalPadding-[appleImageView(iconImageViewWidth)]-[appLabel]-[skipButton]-horizontalPadding-|",
            options: [.alignAllCenterY],
            metrics: metrics,
            views: views
        )
        allConstraints += topRowHorizontalConstraints
        
        let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[appleImageView]-10-[swiftImageView]",
            metrics: nil,
            views: views
        )
        allConstraints += iconToImageVerticalConstraints
        
        let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-horizontalPadding-[summaryLabel]-horizontalPadding-|",
            metrics: metrics,
            views: views
        )
        allConstraints += summaryHorizontalConstraints
        
        let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]",
            options: [.alignAllLeading, .alignAllTrailing],
            metrics: nil,
            views: views
        )
        allConstraints += summaryLabelVerticalConstraints
        
        let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[swiftImageView(300)]-10-[welcomeLabel]",
            options: [.alignAllCenterX],
            metrics: nil,
            views: views
        )
        allConstraints += imageToWelcomeVerticalConstraints
        
        let swiftImageHeightConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[swiftImageView(300)]",
            metrics: nil,
            views: views
        )
        allConstraints += swiftImageHeightConstraints
        
        let summaryToPageVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[summaryLabel]-15-[pageControl(9)]-15-|",
            options: [.alignAllCenterX],
            metrics: nil,
            views: views
        )
        allConstraints += summaryToPageVerticalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
    }
}

