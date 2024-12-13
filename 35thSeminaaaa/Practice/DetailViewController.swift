//
//  DetailViewController.swift
//  35thSeminar
//
//  Created by 이지훈 on 10/5/24.
//

import UIKit

protocol NicknameDelegate: AnyObject {
  func dataBind(nickname: String)
}

class DetailViewController: UIViewController {
    
    weak var delegate: NicknameDelegate?

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("새 버튼", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(newButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "텍스트를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 설정", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        return button
    }()

    private var receivedTitle: String?
    private var receivedContent: String?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .lightGray
    }
    
    private func setUI() {
        [titleLabel, contentLabel, backButton, newButton, textField, settingButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            newButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            newButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 44),
            newButton.widthAnchor.constraint(equalToConstant: 300),
            
            settingButton.topAnchor.constraint(equalTo: newButton.bottomAnchor, constant: 20),
            settingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingButton.heightAnchor.constraint(equalToConstant: 44),
            settingButton.widthAnchor.constraint(equalToConstant: 300),
            
            backButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func updateUI() {
        self.titleLabel.text = receivedTitle
        self.contentLabel.text = receivedContent
    }

    func dataBind(title: String, content: String) {
        self.receivedTitle = title
        self.receivedContent = content
        updateUI()
    }

    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func newButtonTapped() {
        print("New button tapped")
    }
    
    @objc func settingButtonTapped() {
         if let nickname = textField.text, !nickname.isEmpty {
             delegate?.dataBind(nickname: nickname)
             self.navigationController?.popViewController(animated: true)
         }
     }
}
