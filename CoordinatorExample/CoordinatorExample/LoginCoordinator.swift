//
//  LoginCoordinator.swift
//  CoordinatorExample
//
//  Created by 이태형 on 2022/10/16.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate{
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    let viewController = LoginVC()
    func start() {
        viewController.delegate = self
        
        navigationController.viewControllers = [viewController]  //navigation의 view Stack
    }
}

extension LoginCoordinator: LoginVCDelegate{
    func login(_ userId: String, _ userPw: String) {
        if userId == Singleton.shared.id && userPw == Singleton.shared.password{
            delegate?.didLoggedIn(self)
        }else{
            viewController.isReload = true
            viewController.failToLogin()
        }
    }
    
}
