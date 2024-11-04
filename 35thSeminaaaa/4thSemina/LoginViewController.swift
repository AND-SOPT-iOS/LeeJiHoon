//
//  AuthViewController.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//

import UIKit

import SnapKit
import Then
import Alamofire

class AuthViewController: UIViewController {
    // MARK: - UI Components
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
    }
    
    private let usernameTextField = UITextField().then {
        $0.placeholder = "Username (8자 이하)"
        $0.borderStyle = .roundedRect
        $0.autocorrectionType = .no
        $0.autocapitalizationType = .none
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "Password (8자 이하)"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
    }
    
    private let hobbyTextField = UITextField().then {
        $0.placeholder = "Hobby (8자 이하)"
        $0.borderStyle = .roundedRect
        $0.isHidden = true
    }
    
    private let segmentedControl = UISegmentedControl(items: ["Login", "Register"]).then {
        $0.selectedSegmentIndex = 0
    }
    
    private let actionButton = UIButton(type: .system).then {
        $0.setTitle("Login", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        
        [segmentedControl, usernameTextField, passwordTextField, hobbyTextField, actionButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        [usernameTextField, passwordTextField, hobbyTextField].forEach { textField in
            textField.snp.makeConstraints { make in
                make.height.equalTo(44)
            }
        }
    }
    
    private func setupActions() {
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let isLogin = sender.selectedSegmentIndex == 0
        hobbyTextField.isHidden = isLogin
        actionButton.setTitle(isLogin ? "Login" : "Register", for: .normal)
    }
    
    @objc private func actionButtonTapped() {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              
              !username.isEmpty, !password.isEmpty else {
            showAlert(message: "아이디와 비밀번호를 입력해주세요")
            return
        }
        
        let isLogin = segmentedControl.selectedSegmentIndex == 0
        
        if isLogin {
            performLogin(username: username, password: password)
        } else {
            guard let hobby = hobbyTextField.text, !hobby.isEmpty else {
                showAlert(message: "취미를 입력해주세요")
                return
            }
            performRegister(username: username, password: password, hobby: hobby)
        }
    }
    
    private func performLogin(username: String, password: String) {
        NetworkService.login(username: username, password: password) { [weak self] result in
            switch result {
            case .success(let response):
                if let token = response.result?.token {
                    let mainVC = MainViewController(token: token)
                    let nav = UINavigationController(rootViewController: mainVC)
                    nav.modalPresentationStyle = .fullScreen
                    self?.present(nav, animated: true)
                } else if let code = response.code {
                    self?.showAlert(message: "Login failed: \(code)")
                }
            case .failure(let error):
                self?.showAlert(message: error.localizedDescription)
            }
        }
    }
    
    private func performRegister(username: String, password: String, hobby: String) {
        let parameters = ["username": username,
                         "password": password,
                         "hobby": hobby]
        
        AF.request(Environment.baseURL + "/user",
                  method: .post,
                  parameters: parameters,
                  encoder: JSONParameterEncoder.default)
        .responseDecodable(of: RegisterResponse.self) { [weak self] response in
            switch response.result {
            case .success(let registerResponse):
                if let no = registerResponse.result?.no {
                    self?.showAlert(message: "Registration successful! No: \(no)")
                    self?.segmentedControl.selectedSegmentIndex = 0
                    self?.segmentChanged(self?.segmentedControl ?? UISegmentedControl())
                } else if let code = registerResponse.code {
                    self?.showAlert(message: "Registration failed: \(code)")
                }
            case .failure(let error):
                self?.showAlert(message: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
