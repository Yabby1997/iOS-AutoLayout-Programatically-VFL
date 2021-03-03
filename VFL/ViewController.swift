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
        return label
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
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
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Swift는 macOS, iOS, iPadOS, watchOS, tvOS앱을 개발하기 위한 최적의 언어입니다."
        label.textAlignment = .center
        return label
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
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
        
    }

}

