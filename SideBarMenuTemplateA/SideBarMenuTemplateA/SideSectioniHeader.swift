//
//  SideSectioniHeader.swift
//  SideBarMenuTemplateA
//
//  Created by 이태형 on 2022/07/28.
//

import UIKit

class SideSectioniHeader: UITableViewHeaderFooterView {

    var isOpened = false
    var sectionIndex = 0
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expandBtn: UIImageView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if isOpened{
            expandBtn.image = UIImage(systemName: "chevron.up")
            expandBtn.tintColor = #colorLiteral(red: 0.3920538425, green: 0.7686622739, blue: 0.6783398986, alpha: 1)
        }
        else{
            expandBtn.image = UIImage(systemName: "chevron.down")
            expandBtn.tintColor = UIColor.lightGray
        }
        
        self.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(selectedSection))
    }

    @objc func selectedSection(_ sender: UITapGestureRecognizer){
        NotificationCenter.default.post(name: Notification.Name("expandSection"), object: nil, userInfo: ["sectionIndex": sectionIndex])
    }

}
