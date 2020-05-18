//
//  WorldwideOverviewVC.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class WorldwideStatsVC: UIViewController {
    let todayLabel = CLLabel(textAlignment: .left, fontSize: 20)
    let yesterdayLabel = CLLabel(textAlignment: .left, fontSize: 20)
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let tableView = UITableView()
    var itemCardToday = CLCardInfoVC()
    var itemCardYesterday = CLCardInfoVC()
    var casesByCountry: [CasesByCountryDataModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        configureTableView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
                print("test")
        loadTableViewWithData()
        loadWorldwideDataToday()
        loadWorldwideDataYesterday()
    }
    
    func loadWorldwideDataToday() {
        let currentDate = Date().convertToAPIDateFormat()
        
        NetworkManager.shared.getWorldwideData(dateString: currentDate, completion: { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let worldwideData):
                DispatchQueue.main.async {
                    self.configureTodayLabel()
                    self.configureCLCardInfo(dataSet: worldwideData, itemCard: self.itemCardToday)
                }
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func loadWorldwideDataYesterday() {
        var dayComponent = DateComponents()
        dayComponent.day = -1 // For removing one day (yesterday): -1
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent, to: Date())
        let yesterdayDate = nextDate!.convertToAPIDateFormat()
    
        NetworkManager.shared.getWorldwideData(dateString: yesterdayDate, completion: { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let worldwideData):
                DispatchQueue.main.async {
                    self.configureYesterdayLabel()
                    self.configureCLCardInfo(dataSet: worldwideData, itemCard: self.itemCardYesterday)
                }
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func loadTableViewWithData() {
        NetworkManager.shared.getCasesByCountryData(completion: { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let casesByCountryData):
                self.casesByCountry = casesByCountryData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        })
        
    }
}

extension WorldwideStatsVC { //UI Functions
    private func configureCLCardInfo(dataSet: WorldwideDataModel, itemCard: CLCardInfoVC) {
 
        itemCard.itemInfoViewOne.setup(title: "Total Cases:", count: returnFormattedNumber(numberToConvert: dataSet.totalCases))
        itemCard.itemInfoViewTwo.setup(title: "Active:", count: returnFormattedNumber(numberToConvert: dataSet.active))
        itemCard.itemInfoViewThree.setup(title: "Recovered:", count: returnFormattedNumber(numberToConvert: dataSet.recovered))
        itemCard.itemInfoViewFour.setup(title: "Critical:", count: returnFormattedNumber(numberToConvert: dataSet.critical))
        itemCard.itemInfoViewFive.setup(title: "New Deaths:", count: returnFormattedNumber(numberToConvert: dataSet.newDeaths))
        itemCard.itemInfoViewSix.setup(title: "Total Deaths:", count: returnFormattedNumber(numberToConvert: dataSet.totalDeaths))
    }
    
    private func configureTodayLabel() {
        self.todayLabel.text = "Today:"
    }
    
    private func configureYesterdayLabel() {
        self.yesterdayLabel.text = "Yesterday:"
    }
    
    private func configureTableView() {
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WorldwideCell.self, forCellReuseIdentifier: WorldwideCell.reuseID)
    }
    
    private func setupLayout() {
        view.addSubview(itemViewOne)
        view.addSubview(todayLabel)
        view.addSubview(yesterdayLabel)
        view.addSubview(itemViewTwo)
        view.addSubview(tableView)
        
        addChildVC(childVC: self.itemCardToday, to: self.itemViewOne)
        addChildVC(childVC: self.itemCardYesterday, to: self.itemViewTwo)
        
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            todayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            todayLabel.heightAnchor.constraint(equalToConstant: 30),
            
            itemViewOne.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 5),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            itemViewOne.heightAnchor.constraint(equalToConstant: 155),
            
            yesterdayLabel.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: 10),
            yesterdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            yesterdayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            yesterdayLabel.heightAnchor.constraint(equalToConstant: 30),

            itemViewTwo.topAnchor.constraint(equalTo: yesterdayLabel.bottomAnchor, constant: 5),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 155),
            
            tableView.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addChildVC(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}


extension WorldwideStatsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casesByCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorldwideCell.reuseID) as! WorldwideCell
        let countryData = casesByCountry[indexPath.row]
        cell.set(country: countryData.countryName, casesCount: returnFormattedNumber(numberToConvert: countryData.casesForCountry))
        return cell
    }
}
