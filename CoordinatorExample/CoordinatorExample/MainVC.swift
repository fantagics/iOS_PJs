//
//  MainVC.swift
//  CoordinatorExample
//
//  Created by 이태형 on 2022/10/16.
//

import UIKit

//delegatePattern
protocol MainVCDelegate{
    func logout()
}

class MainVC: UIViewController {
    var loginSuccess = false
    
    var delegate: MainVCDelegate?

    //MARK: LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        firstLogin()
    }
    
}

extension MainVC{
    @objc func didTapLogoutBtn(_ sender: UIBarButtonItem){
        delegate?.logout()
    }
    func firstLogin(){
        if loginSuccess{
            loginSuccess = false
            present(UIAlertController.successLoginAlert(), animated: true)
        }
    }
}

//MARK: - inital_UI
extension MainVC{
    private func setup(){
        setNavigation()
        setAttribute()
        setUI()
    }
    //Navigation
    private func setNavigation(){
        let logoutButton = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(didTapLogoutBtn(_:)))
        navigationItem.rightBarButtonItem = logoutButton
    }
    //Attribute
    private func setAttribute(){
        view.backgroundColor = .orange
    }
    //UI
    private func setUI(){
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
