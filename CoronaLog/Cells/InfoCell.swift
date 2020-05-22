//
//  InfoCell.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/22/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    static let reuseID  = "infoCell"
    let titleLabel = CLLabel(textAlignment: .center, fontSize: 28)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String) {
        titleLabel.text = title
    }
    
    private func configure() {
        selectionStyle = .none
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
}
