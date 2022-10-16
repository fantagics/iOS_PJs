//
//  Singleton.swift
//  CoordinatorExample
//
//  Created by 이태형 on 2022/10/16.
//

import Foundation
import UIKit

class Singleton{
    static let shared: Singleton = Singleton()
        private init(){}

//    let id: String = "admin"
//    let password: String = "aaaaaaaa"
    let id: String = "a"
    let password: String = "a"
}
