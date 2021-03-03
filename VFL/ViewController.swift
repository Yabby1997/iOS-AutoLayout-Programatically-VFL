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
        static let verticalPadding: CGFloat = 20.0
        static let horizontalPadding: CGFloat = 15.0
        static let appleImageViewWidth: CGFloat = 30.0
        static let swiftImageViewWidth: CGFloat = 100
    }
    
    private var allConstraints: [NSLayoutConstraint] = []
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        if !allConstraints.isEmpty {
            NSLayoutConstraint.deactivate(allConstraints)
            allConstraints.removeAll()
        }
        
        let newInsets = view.safeAreaInsets
        let leftMargin = newInsets.left > 0 ? newInsets.left : Metrics.horizontalPadding
        let rightMargin = newInsets.right > 0 ? newInsets.right : Metrics.horizontalPadding
        let topMargin = newInsets.top > 0 ? newInsets.top : Metrics.verticalPadding
        let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : Metrics.verticalPadding
        
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
            "verticalPadding": Metrics.verticalPadding,
            "horizontalPadding": Metrics.horizontalPadding,
            "appleImageViewWidth": Metrics.appleImageViewWidth,
            "swiftImageViewWidth": Metrics.swiftImageViewWidth,
            "topMargin": topMargin,
            "bottomMargin": bottomMargin,
            "leftMargin": leftMargin,
            "rightMargin": rightMargin,
        ]

        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-topMargin-[appleImageView(appleImageViewWidth)]",
            metrics: metrics,
            views: views
        )
        allConstraints += iconVerticalConstraints

        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-leftMargin-[appleImageView(appleImageViewWidth)]-[appLabel]-[skipButton]-rightMargin-|",
            options: [.alignAllCenterY],
            metrics: metrics,
            views: views
        )
        allConstraints += topRowHorizontalConstraints
        
        let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-leftMargin-[summaryLabel]-rightMargin-|",
            metrics: metrics,
            views: views
        )
        allConstraints += summaryHorizontalConstraints
        
        let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[appleImageView]-10-[swiftImageView]",
            metrics: nil,
            views: views
        )
        allConstraints += iconToImageVerticalConstraints
        
        let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[swiftImageView(swiftImageViewWidth)]-10-[welcomeLabel]",
            options: [.alignAllCenterX],
            metrics: metrics,
            views: views
        )
        allConstraints += imageToWelcomeVerticalConstraints
        
        let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]",
            options: [.alignAllLeading, .alignAllTrailing],
            metrics: nil,
            views: views
        )
        allConstraints += summaryLabelVerticalConstraints
        
        let swiftImageHeightConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[swiftImageView(swiftImageViewWidth)]",
            metrics: metrics,
            views: views
        )
        allConstraints += swiftImageHeightConstraints
        
        let summaryToPageVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[summaryLabel]-verticalPadding-[pageControl(9)]-bottomMargin-|",
            options: [.alignAllCenterX],
            metrics: metrics,
            views: views
        )
        allConstraints += summaryToPageVerticalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
    }
}

