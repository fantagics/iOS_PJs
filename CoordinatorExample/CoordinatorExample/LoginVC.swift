//
//  ViewController.swift
//  CoordinatorExample
//
//  Created by 이태형 on 2022/10/15.
//

import UIKit

//delegatePattern
protocol LoginVCDelegate{
    func login(_ userId: String, _ userPw: String)
}

class LoginVC: UIViewController {
    let idLabel = UILabel()
    let pwLabel = UILabel()
    let idField = UITextField()
    let pwField = UITextField()
    let loginButton = UIButton()
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEdit(_:)))
    var isReload = false
    
    var delegate: LoginVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

//MARK: Func
extension LoginVC{
    @objc func didTapLoginBtn(_ sender: UIButton){
        guard let idText = idField.text else{return}
        guard let pwText = pwField.text else{return}
        if (idText.count > 0) && (pwText.count > 0) {
            delegate?.login(idText, pwText)
        }else{
            present(UIAlertController.failLoginAlert(), animated: true)
        }
    }
    
    @objc func endEdit(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    func failToLogin(){
        if isReload{
            isReload = true
            present(UIAlertController.failLoginAlert(), animated: true)
        }
    }
}

//MARK: - inital_UI
extension LoginVC{
    private func setup(){
        setAttribute()
        setUI()
    }
    //Attribute
    private func setAttribute(){
        [idLabel, pwLabel].forEach{
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .black
        }
        idLabel.text = "ID: "
        pwLabel.text = "PW: "
        [idField, pwField].forEach{
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .black
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.cgColor
        }
        pwField.isSecureTextEntry = true
        [loginButton].forEach{
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
            $0.setTitleColor(.orange, for: .normal)
            $0.layer.cornerRadius = 18
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.orange.cgColor
            $0.addTarget(self, action: #selector(didTapLoginBtn(_:)), for: .touchUpInside)
        }
    }
    //UI
    private func setUI(){
        let idStack = UIStackView(arrangedSubviews: [idLabel, idField])
        idStack.axis = .horizontal
        idStack.distribution = .fill
        idStack.spacing = 5
        
        let pwStack = UIStackView(arrangedSubviews: [pwLabel, pwField])
        pwStack.axis = .horizontal
        pwStack.distribution = .fill
        pwStack.spacing = 5
        
        view.addGestureRecognizer(tapGesture)
        view.addSubview(idStack)
        view.addSubview(pwStack)
        view.addSubview(loginButton)
        
        [idStack, idField, pwStack, pwField, loginButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            idStack.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            idStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            idStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            idStack.heightAnchor.constraint(equalToConstant: 30),
            idField.widthAnchor.constraint(equalTo: idStack.widthAnchor, multiplier: 0.85),
            
            pwStack.topAnchor.constraint(equalTo: idStack.bottomAnchor,constant: 10),
            pwStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            pwStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            pwStack.heightAnchor.constraint(equalToConstant: 30),
            pwField.widthAnchor.constraint(equalTo: pwStack.widthAnchor, multiplier: 0.85),
            
            loginButton.topAnchor.constraint(equalTo: pwStack.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
}
