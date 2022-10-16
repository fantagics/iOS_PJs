//
//  ETAlertController.swift
//  CoordinatorExample
//
//  Created by 이태형 on 2022/10/16.
//

import Foundation
import UIKit

extension UIAlertController{
    static func failLoginAlert()-> UIAlertController{
        let alertController = UIAlertController(title: "로그인 실패", message: "다시한번 아이디와 비밀번호를 확인해 주세요.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(confirmAction)
        return alertController
    }
    
    static func successLoginAlert()-> UIAlertController{
        let alertController = UIAlertController(title: "로그인 성공", message: "환영합니다!", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(confirmAction)
        return alertController
    }
}
