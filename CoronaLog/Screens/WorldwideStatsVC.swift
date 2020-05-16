//
//  WorldwideOverviewVC.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class WorldwideStatsVC: UIViewController {
    let todayLabel = CLLabel(textAlignment: .left, fontSize: 25)
    let itemViewOne = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadWorldWideData()
        setupLayout()
    }
    
    
    func loadWorldWideData() {
        let currentDate = Date().convertToAPIDateFormat()
        NetworkManager.shared.getWorldwideData(dateString: currentDate, completion: { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let worldwideData):
                DispatchQueue.main.async {
                    self.configureTodayLabel()
                    self.configureCLCardInfo(dataSet: worldwideData)
                }
                
            case .failure(let error):
                print(error)
            }
            
        })
    }
    
    func returnFormattedNumber(numberToConvert: Int) -> String{
        let formatter = NumberFormatter()
        formatter.locale = NSLocale.current // this ensures the right separator behavior
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.usesGroupingSeparator = true
        
        return formatter.string(from: NSNumber(value: numberToConvert)) ?? "---"
        
    }
}

extension WorldwideStatsVC { //UI Functions
    private func configureCLCardInfo(dataSet: WorldwideDataModel) {
        let itemCardOne = CLCardInfoVC()
        
        itemCardOne.itemInfoViewOne.setup(title: "Total Cases:", count: returnFormattedNumber(numberToConvert: dataSet.totalCases))
        
        itemCardOne.itemInfoViewTwo.setup(title: "Active:", count: returnFormattedNumber(numberToConvert: dataSet.active))
        itemCardOne.itemInfoViewThree.setup(title: "Recovered:", count: returnFormattedNumber(numberToConvert: dataSet.recovered))
        itemCardOne.itemInfoViewFour.setup(title: "Critical:", count: returnFormattedNumber(numberToConvert: dataSet.critical))
        itemCardOne.itemInfoViewFive.setup(title: "New Deaths:", count: returnFormattedNumber(numberToConvert: dataSet.newDeaths))
        itemCardOne.itemInfoViewSix.setup(title: "Total Deaths:", count: returnFormattedNumber(numberToConvert: dataSet.totalDeaths))
        addChildVC(childVC: itemCardOne, to: self.itemViewOne)
    }
    
    private func configureTodayLabel() {
        self.todayLabel.text = "Today:"
    }
    
    private func setupLayout() {
        view.addSubview(itemViewOne)
        view.addSubview(todayLabel)
        
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            todayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            todayLabel.heightAnchor.constraint(equalToConstant: 30),
        
            itemViewOne.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 10),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            itemViewOne.heightAnchor.constraint(equalToConstant: 155)
        ])
    }
    
    func addChildVC(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
