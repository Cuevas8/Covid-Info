//
//  CLTextField.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class CLTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCLTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCLTextField() {
        layer.cornerRadius = 9
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        
        font = UIFont.preferredFont(forTextStyle: .title3)
        adjustsFontSizeToFitWidth = true
        backgroundColor = .tertiarySystemBackground
        
        placeholder = "Enter a Country Name"
        translatesAutoresizingMaskIntoConstraints = false
        returnKeyType = .search
    }
}
