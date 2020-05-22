//
//  InformationVC.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/19/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit
import SafariServices

class InformationVC: UIViewController {
    
    let tableView = UITableView()
    var infoCellData = [InfoCellModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoCellData()
        configureTableView()
    }
    
    func setupInfoCellData() {
        guard let urlFirst = URL(string: "https://www.who.int/health-topics/coronavirus?fbclid=IwAR1NSZorG2KaxdF4nnS06pPwQ1IKIoNzCO5iIOAUyT7cZ3Ox_UGrQqDva2s#tab=tab_1"),
        let urlSecond = URL(string:"https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html?fbclid=IwAR3z_SUglWUc4Fw9MWxxJB9Y8TKdZyl-0R95q00QET-MLGDffMYnDuQRido"),
        let urlThird = URL(string: "https://landing.google.com/screener/covid19?fbclid=IwAR2uerxw7sUYbVyvyeVu8cHybHo-4XvwcNiLyRLPRiFDLBe-q5BEbMA81dg"),
        let urlFourth = URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/if-you-are-sick/steps-when-sick.html"),
        let urlFifth = URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/if-you-are-sick/quarantine-isolation.html")
        else { return }
        
        let firstCellData = InfoCellModel(title: "What is the Corona Virus ?", url: urlFirst)
        let secondCellData = InfoCellModel(title: "How to protect yourself ?", url: urlSecond)
        let thirdCellData = InfoCellModel(title: "Self-Assessment", url: urlThird)
        let fourthCellData = InfoCellModel(title: "What to do if you are sick ?", url: urlFourth)
        let fifthCellData = InfoCellModel(title: "Quarantine and Isolation", url: urlFifth)
        
        infoCellData = [firstCellData, secondCellData, thirdCellData, fourthCellData, fifthCellData]
    }
    
    func setupUILayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 100
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.reuseID)
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        
        safariVC.preferredControlTintColor = .systemTeal
        present(safariVC, animated: true)
    }
}

extension InformationVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.reuseID) as! InfoCell
        let info = infoCellData[indexPath.row]
        cell.set(title: info.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentSafariVC(with: infoCellData[indexPath.row].url)
    }
}


