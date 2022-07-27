//
//  CustomHeaderView.swift
//  SpreadSectionOfTableView
//
//  Created by 이태형 on 2022/07/22.
//

import UIKit

//protocol HeaderViewDelegate: AnyObject{
//    func tappedSection(_ sectionIndex: Int)
//}

class CustomHeaderView: UITableViewHeaderFooterView{
    var isOpened = false
    var sectionIndex = 0
//    var delegate: HeaderViewDelegate?
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expandBtn: UIImageView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if isOpened{
            expandBtn.image = UIImage(systemName: "chevron.up")
        }
        else{
            expandBtn.image = UIImage(systemName: "chevron.down")
        }
        
        self.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(selectedSection))
    }
    
    @objc func selectedSection(_ sender: UITapGestureRecognizer){
        print( "Tapped: \(self.sectionIndex)")
//        delegate?.tappedSection(self.sectionIndex)
        NotificationCenter.default.post(name: Notification.Name("expandSection"), object: nil, userInfo: ["sectionIndex": sectionIndex])
    }
}
