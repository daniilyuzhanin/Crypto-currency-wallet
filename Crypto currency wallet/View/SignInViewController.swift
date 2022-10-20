//
//  SignInViewController.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//
import UIKit

final class SignInViewController: BaseViewController {
    
    var VM: (SignInProtocolIn & SignInProtocolOut)?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Crypto Currency Wallet"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let login: UITextField = {
        let login = UITextField()
        login.borderStyle = .none
        login.layer.cornerRadius = 5
        login.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 0.93, alpha: 0.93)
        login.font = UIFont.systemFont(ofSize: 17)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Email"
        return login
    }()
    
    private let password: UITextField = {
        let password = UITextField()
        password.borderStyle = .none
        password.layer.cornerRadius = 5
        password.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 0.93, alpha: 0.93)
        password.font = UIFont.systemFont(ofSize: 17)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Password"
        return password
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 0.48, green: 0.16, blue: 0.16, alpha: 1.00)
        button.setTitle("Sign In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.scrollEdgeAppearance = nil
        
    }
    
    override func listenViewModel() {
        guard var VM = VM else { return }
        
        VM.getFlag = { [ weak self ] flag in
            if flag {
                self?.goToHomePage(flag: flag)
                
            } else {
                let alert = UIAlertController(title: "Sign In", message: "Please, check your user or password information", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(okButton)
                self?.present(alert, animated: true)
            }
            
        }
        
    }
    
    override func layoutVC() {
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
        ])
        
        view.addSubview(login)
        NSLayoutConstraint.activate([
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            login.widthAnchor.constraint(equalToConstant: 300),
            login.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(password)
        NSLayoutConstraint.activate([
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            password.widthAnchor.constraint(equalToConstant: 300),
            password.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    private func tapButton() {
        guard let loginText = login.text,
              let passwordText = password.text else { return }
        
        VM?.checkLogin(login: loginText, password: passwordText)
    }
    
    private func goToHomePage(flag: Bool) {
        guard flag else { return }
        let vc = Builder.buildHome()
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
}
