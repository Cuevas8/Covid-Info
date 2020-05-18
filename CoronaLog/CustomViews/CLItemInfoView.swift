//
//  CLItemInfoView.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class CLItemInfoView: UIView {
    
    let titleLabel = CLLabel(textAlignment: .center, fontSize: 15)
    let countLabel = CLLabel(textAlignment: .center, fontSize: 18)
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    convenience init(title: String, count: String) {
        self.init(frame: .zero)
        titleLabel.text = title
        countLabel.text = count
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(titleLabel)
        addSubview(countLabel)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
    func setup(title: String, count: String){
        titleLabel.text = title
        countLabel.text = count
    }
    
}
