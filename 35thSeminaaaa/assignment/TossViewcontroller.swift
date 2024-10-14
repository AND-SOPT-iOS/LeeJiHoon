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
    
    private let appIconImageView = UIImageView().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20
        $0.image = UIImage(named: "toss")
        $0.clipsToBounds = true
    }
    
    private let appNameLabel = UILabel().then {
        $0.text = "토스"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let appDescriptionLabel = UILabel().then {
        $0.text = "금융이 쉬워진다"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    private let categoryDescriptionLabel = UILabel().then {
        $0.text = "차트"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = "👶"
        $0.font = .boldSystemFont(ofSize: 28)
    }
    
    private let getButton = UIButton(type: .system).then {
        $0.setTitle("열기", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 14
    }
    
    private let shareButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
    }
    
    private let ratingView = UIView()
    private let ratingLabel = UILabel().then {
        $0.text = "4.4"
        $0.font = .boldSystemFont(ofSize: 28)
    }
    
    private let ratingCountLabel = UILabel().then {
        $0.text = "8.4만개의 평가"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    private let ratingStarsLabel = UILabel().then {
        $0.text = "★★★★☆"
        $0.font = .systemFont(ofSize: 10)
    }
    
    private let ageRatingLabel = UILabel().then {
        $0.text = "4+"
        $0.font = .boldSystemFont(ofSize: 28)
    }
    
    private let ageRatingDescriptionLabel = UILabel().then {
        $0.text = "연령"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [appIconImageView, appNameLabel, appDescriptionLabel, getButton, shareButton,
         ratingView, categoryDescriptionLabel, categoryLabel, ageRatingDescriptionLabel, ageRatingLabel].forEach { contentView.addSubview($0) }
        
        [ratingCountLabel, ratingLabel, ratingStarsLabel].forEach { ratingView.addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        appIconImageView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView).offset(20)
            $0.width.height.equalTo(120)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(appIconImageView)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(20)
            $0.trailing.lessThanOrEqualTo(contentView).offset(-20)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(appNameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(appNameLabel)
        }
        
        getButton.snp.makeConstraints {
            $0.top.equalTo(appDescriptionLabel.snp.bottom).offset(10)
            $0.leading.equalTo(appNameLabel)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(getButton)
            $0.trailing.equalTo(contentView).offset(-20)
            $0.width.height.equalTo(30)
        }
        ratingView.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.bottom).offset(30)
            $0.leading.equalTo(contentView).offset(20)
            $0.width.equalTo(100)
        }
        
        ratingCountLabel.snp.makeConstraints {
            $0.top.leading.equalTo(ratingView)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingCountLabel.snp.bottom).offset(4)
            $0.leading.equalTo(ratingCountLabel)
        }
        
        ratingStarsLabel.snp.makeConstraints {
            $0.top.equalTo(ratingLabel.snp.bottom).offset(4)
            $0.leading.equalTo(ratingLabel)
        }
        
        categoryDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(ratingView)
            $0.leading.equalTo(ratingView.snp.trailing).offset(40)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(categoryDescriptionLabel.snp.bottom).offset(4)
            $0.leading.equalTo(categoryDescriptionLabel)
        }
        
        ageRatingDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(ratingView)
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(40)
        }
        
        ageRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ageRatingDescriptionLabel.snp.bottom).offset(4)
            $0.leading.equalTo(ageRatingDescriptionLabel)
        }
    }
}
