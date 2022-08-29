//
//  ViewController.swift
//  ExpandByTouchOnSection
//
//  Created by 이태형 on 2022/08/22.
//
//https://velog.io/@yongchul/iOSTableView-Expand-by-touch-section-tableView-section%EB%B3%84%EB%A1%9C-%EC%A0%91%EC%97%88%EB%8B%A4-%ED%8E%B4%EA%B8%B0

import UIKit

class ViewController: UIViewController {
    let sectionTitle = ["fruit", "animal", "hobby", "vegetable"]
    let dataList = [["apple", "banana", "coconut"],
                    ["dog", "elephant", "frog", "giraffe"],
                    ["music", "game"],
                    ["carrot"]
    ]
    var isOpen = [true, false, false, false]
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isOpen[section] {
            return dataList[section].count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = dataList[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? CustomHeaderView else{return UITableViewHeaderFooterView()}
        
        headerView.sectionNumber = section
        headerView.titleLabel.text = sectionTitle[section]
        headerView.iconImageView.image = isOpen[section] ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        headerView.delegate = self
        
        return headerView
    }
}

extension ViewController: HeaderViewDelegate{
    func didTouchSection(_ sectionIndex: Int) {
        print("didTouchSection")
        self.isOpen[sectionIndex].toggle()
        self.tableView.reloadData()
    }
}

extension ViewController{
    private func style(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerView")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    private func layout(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
