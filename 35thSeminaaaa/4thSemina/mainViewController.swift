//
//  mainViewController.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//

import UIKit
import SnapKit
import Then
import Alamofire

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let token: String
    
    // MARK: - UI Components
    private let myHobbyLabel = UILabel().then {
        $0.text = "내 취미: 로딩 중..."
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private let userNoTextField = UITextField().then {
        $0.placeholder = "조회할 사용자 번호"
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
        $0.backgroundColor = .systemBackground
    }
    
    private let otherHobbyLabel = UILabel().then {
        $0.text = "다른 사람 취미: "
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private let searchButton = UIButton(type: .system).then {
        $0.setTitle("다른 사람 취미 조회", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
    }
    
    private let newPasswordTextField = UITextField().then {
        $0.placeholder = "새 비밀번호 (8자 이하)"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
        $0.backgroundColor = .systemBackground
    }
    
    private let newHobbyTextField = UITextField().then {
        $0.placeholder = "새 취미 (8자 이하)"
        $0.borderStyle = .roundedRect
        $0.backgroundColor = .systemBackground
    }
    
    private let updateButton = UIButton(type: .system).then {
        $0.setTitle("정보 수정", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
    }
    
    private lazy var searchStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.addArrangedSubview(userNoTextField)
        $0.addArrangedSubview(searchButton)
        $0.addArrangedSubview(otherHobbyLabel)
    }
    
    private lazy var updateStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.addArrangedSubview(newPasswordTextField)
        $0.addArrangedSubview(newHobbyTextField)
        $0.addArrangedSubview(updateButton)
    }
    
    // MARK: - Lifecycle
    init(token: String) {
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupActions()
        loadMyHobby()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "취미 앱"
        
        [myHobbyLabel, searchStackView, updateStackView].forEach {
            view.addSubview($0)
        }
        
        [searchButton, updateButton].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(44)
            }
        }
    }
    
    private func setupConstraints() {
        myHobbyLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        searchStackView.snp.makeConstraints { make in
            make.top.equalTo(myHobbyLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        updateStackView.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setupActions() {
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        updateButton.addTarget(self, action: #selector(updateTapped), for: .touchUpInside)
    }
    
    // MARK: - Network Requests
    private func loadMyHobby() {
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(Environment.baseURL + "/user/my-hobby",
                  method: .get,
                  headers: headers)
        .responseDecodable(of: HobbyResponse.self) { [weak self] response in
            switch response.result {
            case .success(let hobbyResponse):
                if let hobby = hobbyResponse.result?.hobby {
                    self?.myHobbyLabel.text = "내 취미: \(hobby)"
                } else if let code = hobbyResponse.code {
                    self?.showAlert(message: "취미 조회 실패: \(code)")
                }
            case .failure(let error):
                self?.showAlert(message: error.localizedDescription)
            }
        }
    }
    
    @objc private func searchTapped() {
        guard let userNoText = userNoTextField.text,
              let userNo = Int(userNoText) else {
            showAlert(message: "올바른 사용자 번호를 입력해주세요")
            return
        }
        
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(Environment.baseURL + "/user/\(userNo)/hobby",
                  method: .get,
                  headers: headers)
        .responseDecodable(of: HobbyResponse.self) { [weak self] response in
            switch response.result {
            case .success(let hobbyResponse):
                if let hobby = hobbyResponse.result?.hobby {
                    self?.otherHobbyLabel.text = "다른 사람 취미: \(hobby)"
                } else if let code = hobbyResponse.code {
                    self?.showAlert(message: "취미 조회 실패: \(code)")
                }
            case .failure(let error):
                self?.showAlert(message: error.localizedDescription)
            }
        }
    }
    
    @objc private func updateTapped() {
        let password = newPasswordTextField.text
        let hobby = newHobbyTextField.text
     
        
        if let password = password, password.count > 8 {
            showAlert(message: "비밀번호는 8자 이하여야 합니다")
            return
        }
        
        if let hobby = hobby, hobby.count > 8 {
            showAlert(message: "취미는 8자 이하여야 합니다")
            return
        }
        
        let parameters: [String: String] = [
            "password": password,
            "hobby": hobby
        ].compactMapValues { $0 }
        
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(Environment.baseURL + "/user",
                  method: .put,
                  parameters: parameters,
                  encoder: JSONParameterEncoder.default,
                  headers: headers)
        .responseDecodable(of: HobbyResponse.self) { [weak self] response in
            switch response.result {
            case .success(let updateResponse):
                if updateResponse.code == nil {
                    self?.showAlert(message: "정보가 성공적으로 업데이트되었습니다")
                    self?.newPasswordTextField.text = ""
                    self?.newHobbyTextField.text = ""
                    self?.loadMyHobby()
                } else if let code = updateResponse.code {
                    self?.showAlert(message: "업데이트 실패: \(code)")
                }
            case .failure(let error):
                self?.showAlert(message: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
