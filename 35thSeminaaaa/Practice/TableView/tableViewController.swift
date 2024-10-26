//
//  tableViewController.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 10/26/24.
//

import Foundation
import UIKit

class tableViewController : UIViewController {
    
    
    private func setStyle() {
        titleLabel.do {
            $0.numberOfLines = 2
        }
        verticalStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
    }
    
    private func setUI() {
        [
            iconImageView,
            rankingLabel,
            verticalStackView,
            downloadButton
        ].forEach { addSubview($0) }
        
        [
            titleLabel,
            subTitleLabel
        ].forEach { verticalStackView.addArrangedSubview($0) }
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(80)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(12)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(12)
            $0.bottom.greaterThanOrEqualToSuperview().inset(12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(44)
            $0.height.equalTo(20)
        }
    }
}
