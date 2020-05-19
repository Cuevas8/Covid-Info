//
//  CLCardInfoVC.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class CLCardInfoVC: UIViewController {
    
    let stackView = UIStackView()
    let stackView2 = UIStackView()
    let itemInfoViewOne = CLItemInfoView()
    let itemInfoViewTwo = CLItemInfoView()
    let itemInfoViewThree = CLItemInfoView()
    let itemInfoViewFour = CLItemInfoView()
    let itemInfoViewFive = CLItemInfoView()
    let itemInfoViewSix = CLItemInfoView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackViews()
    }
    
    private func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .systemTeal
    }
    
    private func configureStackViews() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        stackView2.spacing = 20
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
        stackView.addArrangedSubview(itemInfoViewThree)
        
        stackView2.addArrangedSubview(itemInfoViewFour)
        stackView2.addArrangedSubview(itemInfoViewFive)
        stackView2.addArrangedSubview(itemInfoViewSix)
    }
    
    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(stackView2)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: padding),
            stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
//    private func configureItems() {
//        itemInfoViewOne.setup(title: "Total:", count: "1,000,234")
//        itemInfoViewTwo.setup(title: "Active:", count: "80,234")
//        itemInfoViewThree.setup(title: "Recovered:", count: "80,234")
//
//        itemInfoViewFour.setup(title: "Critical:", count: "5,234")
//        itemInfoViewFive.setup(title: "New Deaths", count: "8,234")
//        itemInfoViewSix.setup(title: "Deaths:", count: "834")
//    }

}
