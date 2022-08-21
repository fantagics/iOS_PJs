//
//  ViewController.swift
//  StarSlider
//
//  Created by 이태형 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {
    var starArray = [UIImageView]()
    
//MARK: - @IBOutlet
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var starSlider: UISlider!
    @IBOutlet weak var starLabel: UILabel!
    
    
//MARK: - LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initStarImageArray()
        
    }
    
    
//MARK: - function
    private func initStarImageArray(){
        for i in 0...4{
            starArray.append(starStackView.subviews[i] as? UIImageView ?? UIImageView())
        }
        starSlider.thumbTintColor = .clear
    }
    
    
//MARK: - @IBAction
    @IBAction func starValueChanged(_ sender: UISlider) {
        let value = round(starSlider.value)
        var half = value.truncatingRemainder(dividingBy: 2)
        let result = Int(value)
        for i in 0...4{
            if i < Int(value/2){
                starArray[i].image = UIImage(named: "ic_star_large_full")
            }else{
                if half != 0 {
                    starArray[i].image = UIImage(named: "ic_star_large_half")
                    half = 0
                }
                else{
                    starArray[i].image = UIImage(named: "ic_star_large")                }
            }
        }
        starLabel.text = String(result)
    }
    
    
}
