//
//  ChartCell.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 10/26/24.
//

import UIKit
import SnapKit
import Then

class ChartCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ChartCell"
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }
    
    private let rankingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    
    private let subTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    private let downloadButton = UIButton().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .systemBlue
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let verticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUI() {
        [iconImageView, rankingLabel, verticalStackView, downloadButton].forEach {
            contentView.addSubview($0)
        }
        
        [titleLabel, subTitleLabel].forEach {
            verticalStackView.addArrangedSubview($0)
        }
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
            $0.width.equalTo(72)
            $0.height.equalTo(32)
        }
    }
    
    // MARK: - Configuration
    
    func configure(with app: App) {
        iconImageView.image = app.iconImage
        rankingLabel.text = "\(app.ranking)"
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle
        
        switch app.downloadState {
        case .installed:
            downloadButton.setTitle("OPEN", for: .normal)
            downloadButton.backgroundColor = .clear
            downloadButton.setTitleColor(.systemBlue, for: .normal)
        case .download:
            downloadButton.setTitle("GET", for: .normal)
            downloadButton.backgroundColor = .systemGray6
            downloadButton.setTitleColor(.systemBlue, for: .normal)
        case .reDownload:
            downloadButton.setTitle("delete", for: .normal)
            downloadButton.backgroundColor = .systemGray6
            downloadButton.setTitleColor(.systemBlue, for: .normal)
        case .update:
            downloadButton.setTitle("UPDATE", for: .normal)
            downloadButton.backgroundColor = .systemGray6
            downloadButton.setTitleColor(.systemBlue, for: .normal)
        }
    }
}
