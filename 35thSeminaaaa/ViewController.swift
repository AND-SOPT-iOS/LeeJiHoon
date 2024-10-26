//
//  ViewController.swift
//  35thSeminar
//
//  Created by 이지훈 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    weak var delegate: NicknameDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "닉네임"
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var pushMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        updateUI()
    }
    
    private func setUI() {
        [
            titleLabel,
            titleTextField,
            contentTextView,
            nextButton,
            pushModeToggleButton,
            nicknameLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                titleTextField.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 20
                ),
                titleTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                titleTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                titleTextField.heightAnchor.constraint(equalToConstant: 40),
                
                contentTextView.topAnchor.constraint(
                    equalTo: titleTextField.bottomAnchor,
                    constant: 20
                ),
                contentTextView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                contentTextView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                contentTextView.heightAnchor.constraint(
                    equalToConstant: 200
                ),
                
                nextButton.topAnchor.constraint(
                    equalTo: contentTextView.bottomAnchor,
                    constant: 20
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 44),
                nextButton.widthAnchor.constraint(equalToConstant: 300),
                
                pushModeToggleButton.topAnchor.constraint(
                    equalTo: nextButton.bottomAnchor,
                    constant: 20
                ),
                pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pushModeToggleButton.heightAnchor.constraint(equalToConstant: 44),
                pushModeToggleButton.widthAnchor.constraint(equalToConstant: 300),
                
                nicknameLabel.topAnchor.constraint(
                    equalTo: pushModeToggleButton.bottomAnchor,
                    constant: 20
                ),
                nicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    private func updateUI() {
        self.titleLabel.text = pushMode ? "네비게이션" : "모달"
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    @discardableResult
      private func transitionToNextViewController() -> String {
          
          let nextViewController = DetailViewController()
          nextViewController.delegate = self
          guard let title = titleTextField.text,
                let content = contentTextView.text
          else {
              return "데이터 없어요 흑흑"
          }
          nextViewController.dataBind(
              title: title,
              content: content
          )
          if pushMode {
              self.navigationController?.pushViewController(
                  nextViewController,
                  animated: true
              )
          } else {
              self.present(
                  nextViewController,
                  animated: true
              )
          }
          return "데이터 전"
      }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
    
    @objc func nicknameButtonTapped() {
        let nicknameViewController = DetailViewController()
        nicknameViewController.delegate = self
        self.navigationController?.pushViewController(nicknameViewController, animated: true)
    }
}

extension ViewController: NicknameDelegate {
    func dataBind(nickname: String) {
        self.nicknameLabel.text = nickname
    }
}
