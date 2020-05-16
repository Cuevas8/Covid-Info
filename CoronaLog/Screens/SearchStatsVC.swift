//
//  SearchStatsVC.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class SearchStatsVC: UIViewController  {
    
    let searchTextField = CLTextField()
    let searchButton = CLButton()
    
    var isSearchTermEntered: Bool { return !(searchTextField.text?.isEmpty ?? false) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        dismissKeyboardTapGesture()
    }
    
    @objc func pushCountryStatsVC() {
        
        guard isSearchTermEntered else {
            let alert = UIAlertController(title: "Please Enter a Country", message: "Must enter a country name in order to get stats.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        
        let countryStatsVC = CountryStatsVC()
        navigationController?.pushViewController(countryStatsVC, animated: true)
    }

    
    private func setupLayout() {
        
        view.addSubview(searchTextField)
        searchTextField.delegate = self
        
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(pushCountryStatsVC), for: .touchUpInside)

        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            searchTextField.heightAnchor.constraint(equalToConstant: 120),
            
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15),
            searchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            searchButton.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension SearchStatsVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Did tap return")
        return true
    }
    
}
