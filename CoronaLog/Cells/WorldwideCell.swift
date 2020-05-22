//
//  WorldwideCell.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/15/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class WorldwideCell: UITableViewCell {
    
    static let reuseID  = "worldWideCell"
    let countryLabel = CLLabel(textAlignment: .center, fontSize: 20)
    let totalCasesLabel = CLLabel(textAlignment: .center, fontSize: 20)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(country: String, casesCount: String) {
        countryLabel.text = country
        totalCasesLabel.text = casesCount
    }
    
    private func configure() {
        addSubview(countryLabel)
        addSubview(totalCasesLabel)
        
        NSLayoutConstraint.activate([
            countryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            countryLabel.heightAnchor.constraint(equalToConstant: 30),
            countryLabel.widthAnchor.constraint(equalToConstant: 100),
            
            totalCasesLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            totalCasesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            totalCasesLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
