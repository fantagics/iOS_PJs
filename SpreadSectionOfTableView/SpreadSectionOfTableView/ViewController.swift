//
//  ViewController.swift
//  SpreadSectionOfTableView
//
//  Created by 이태형 on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {
    var isOpen = [true, false, false, false]
    var menuList: [String] = ["이웃주민", "도감", "컬렉션", "가이드"]
    var menuDesc: [[String]] = [
        ["주민목록", "우리 섬 주민", "내 선호 주민", "주민 상성표"],
        ["곤충", "물고기", "해산물", "화석", "미술품", "실시간 포획 가능"],
        ["아이템 컬렉션", "특별한 아이템", "DIY레시피", "제스처"],
        ["잠금 해제 조건", "특별한 주민들", "너굴 마일리지", "꽃 교배하기", "마일리지 섬", "무 주식 계산기", "우리 섬 달력"]
    ]
    
    //MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableHeader = Bundle.main.loadNibNamed("CustomTableHeader", owner: self, options: nil)?.last as? UIView
        let tableFooter = Bundle.main.loadNibNamed("CustomTableFooter", owner: self, options: nil)?.last as? UIView
        tableView.tableHeaderView = tableHeader
        tableView.tableFooterView = tableFooter
        tableView.tableHeaderView?.frame.size.height = CGFloat(80)
        tableView.tableFooterView?.frame.size.height = CGFloat(55)
        
        tableView.register(UINib(nibName: "CustomHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "customHeader")
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.expandableSecion(_:)), name: Notification.Name("expandSection"), object: nil)
    }
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - function
    @objc func expandableSecion(_ noti: Notification){
        guard let sectionNum: Int = noti.userInfo?["sectionIndex"] as? Int else{return}
        isOpen[sectionNum].toggle()
        tableView.reloadData()
    }
    
    //MARK: - @IBAction
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuList.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader") as? CustomHeaderView else{return UITableViewHeaderFooterView()}
        
        headerView.isOpened = isOpen[section]
        headerView.sectionIndex = section
        headerView.titleLabel.text = menuList[section]
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isOpen[section] == true {
            return menuDesc[section].count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else{return UITableViewCell()}
        
        cell.descLabel.text = menuDesc[indexPath.section][indexPath.row]
        
        return cell
    }
}
