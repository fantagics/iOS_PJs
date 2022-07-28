//
//  ViewController.swift
//  SideBarMenuTemplateA
//
//  Created by 이태형 on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {
    let sideWidth: CGFloat = 200
    var sideIsVisable = false
    
    
//MARK: - @IBOutlet
    @IBOutlet weak var sideBackView: UIView!
    @IBOutlet weak var sideLeading: NSLayoutConstraint!
    
    
//MARK: - LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideBackView.isHidden = true
        sideBackView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:))))
    }
    
    
//MARK: - function
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer){
        let translationX: CGFloat = sender.translation(in: sender.view).x

        switch sender.state {
        case .began:
            print("PanGesture Began")
        case .changed:
            if -translationX <= sideWidth && -translationX > -1{
                self.sideLeading.constant = translationX
                self.sideBackView.alpha = (200+translationX) / 250
            }
        case .ended:
            if -translationX > (sideWidth/2) {
                self.sideLeading.constant = -sideWidth
                self.sideBackView.isHidden = true
                sideIsVisable = false
            }
            else{
                self.sideLeading.constant = 0
                self.sideBackView.alpha = 0.8
            }
        default:
            break
        }
    }
    
    
    //MARK: - @IBAction
    @IBAction func tapedSideBtn(_ sender: UIBarButtonItem) {
        if !sideIsVisable {
            sideLeading.constant = 0
            sideBackView.isHidden = false
            sideBackView.alpha = 0.8
            sideIsVisable = true
        }
        else{
            sideLeading.constant = -sideWidth
            sideBackView.isHidden = true
            sideIsVisable = false
        }
        
        //animation
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }){(animationComplete) in
            print("animation complete")
        }
    }
    
}

