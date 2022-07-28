//
//  SideContainerView.swift
//  SideBarMenuTemplateA
//
//  Created by 이태형 on 2022/07/28.
//

import UIKit

class SideContainerView: UIViewController {
    let menuList: [String] = ["Menu A", "Menu B", "Menu C", "Menu D"]

    @IBOutlet weak var sideTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


extension SideContainerView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = menuList[indexPath.row]
        
        return cell
        
    }
}
