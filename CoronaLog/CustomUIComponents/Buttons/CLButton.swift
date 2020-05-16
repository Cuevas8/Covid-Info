//
//  CLButton.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class CLButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCLButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCLButton(){
        layer.cornerRadius = 12
        titleLabel?.textColor = .white
        
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemTeal
        setTitle("Search", for: .normal)
    }
}
