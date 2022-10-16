//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by 이태형 on 2022/10/15.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController!) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        showLoginVC()
    }
}

extension AppCoordinator{
    private func showLoginVC(){
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
        coordinator.delegate = self
        childCoordinators.append(coordinator)
    }
    private func showMainVC(){
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.start()
        coordinator.delegate = self
        childCoordinators.append(coordinator)
    }
}


extension AppCoordinator: LoginCoordinatorDelegate{
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        //childCoordinators배열 내부에 childCoordinators이 쌓이는 것을 방지
        childCoordinators = childCoordinators.filter{ $0 !== coordinator}
        showMainVC()
    }
}

extension AppCoordinator: MainCoordinatorDelegate{
    func didLogout(_ coordinator: MainCoordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== coordinator}
        showLoginVC()
    }
}
