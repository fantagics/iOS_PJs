//
//  MainCoordinator.swift
//  CoordinatorExample
//
//  Created by 이태형 on 2022/10/17.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate{
    func didLogout(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var delegate: MainCoordinatorDelegate?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainVC()
        viewController.delegate = self
        viewController.loginSuccess = true
        navigationController.viewControllers = [viewController]
    }
    
}

extension MainCoordinator: MainVCDelegate{
    func logout() {
        delegate?.didLogout(self)
    }
}
