//
//  CustomHeaderView.swift
//  ExpandByTouchOnSection
//
//  Created by 이태형 on 2022/08/22.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView{
    var sectionNumber: Int = 0
    let tapGestureRecognizer = UITapGestureRecognizer()
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    var delegate: HeaderViewDelegate?
    
//    override func draw(_ rect: CGRect, for formatter: UIViewPrintFormatter) {
//        super.draw(rect, for: formatter)
//    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconImageView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .orange
        iconImageView.tintColor = .black
        
        contentView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(didSelectSection))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didSelectSection(){
        print("Section Tapped!!")
        delegate?.didTouchSection(self.sectionNumber)
    }
}

protocol HeaderViewDelegate: AnyObject{
    func didTouchSection(_ sectionIndex: Int)
}
