//
//  TossViewcontroller.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 10/12/24.
//

import UIKit
import SnapKit
import Then

class TossViewcontroller: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.text = "제목"
        $0.font = .boldSystemFont(ofSize: 32)
        $0.numberOfLines = 0
    }
    
    private let versionButton = UIButton(type: .system).then {
        $0.setTitle("버전 기록", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
    }
    
    private let openButton = UIButton(type: .system).then {
        $0.setTitle("열기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
    }
    
    private let shareButton = UIButton(type: .system).then {
        $0.setTitle("공유", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
    }
    
    private let previewImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .lightGray
    }
    
    private let ratingLabel = UILabel().then {
        $0.text = "평가 및 리뷰"
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    private let showAllReviewsButton = UIButton(type: .system).then {
        $0.setTitle("모두 보기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
    }
    
    private let writeReviewButton = UIButton(type: .system).then {
        $0.setTitle("리뷰 작성", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.layer.cornerRadius = 12
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [titleLabel, versionButton, openButton, shareButton, previewImageView, ratingLabel, showAllReviewsButton, writeReviewButton].forEach { contentView.addSubview($0) }
        
        setupConstraints()
        setupActions()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(40)
            make.leading.trailing.equalTo(contentView).inset(20)
        }
        
        versionButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.equalTo(contentView).offset(20)
            make.height.equalTo(44)
        }
        
        openButton.snp.makeConstraints { make in
            make.top.equalTo(versionButton.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.height.equalTo(44)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(openButton.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.height.equalTo(44)
        }
        
        previewImageView.snp.makeConstraints { make in
            make.top.equalTo(shareButton.snp.bottom).offset(40)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(300)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(previewImageView.snp.bottom).offset(40)
            make.leading.equalTo(contentView).offset(20)
        }
        
        showAllReviewsButton.snp.makeConstraints { make in
            make.centerY.equalTo(ratingLabel)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        writeReviewButton.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(40)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(60)
            make.bottom.equalTo(contentView).offset(-40)
        }
    }
    
    private func setupActions() {
        versionButton.addTarget(self, action: #selector(showVersionHistory), for: .touchUpInside)
        showAllReviewsButton.addTarget(self, action: #selector(showAllReviews), for: .touchUpInside)
    }
    
    @objc private func showVersionHistory() {
        let versionHistoryVC = UIViewController().then {
            $0.view.backgroundColor = .white
            $0.title = "버전 기록"
        }
        navigationController?.pushViewController(versionHistoryVC, animated: true)
    }
    
    @objc private func showAllReviews() {
        let allReviewsVC = UIViewController().then {
            $0.view.backgroundColor = .white
            $0.title = "모든 리뷰"
        }
        navigationController?.pushViewController(allReviewsVC, animated: true)
    }
}
