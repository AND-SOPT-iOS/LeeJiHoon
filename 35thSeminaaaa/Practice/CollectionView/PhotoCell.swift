//
//  PhotoCell.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 10/26/24.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    var likeButtonAction: (() -> ())?
    var isLiked = false {
        didSet {
            updateUI()
        }
    }
    
    private let photoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let likeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(PhotoCell.self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setUI() {
        [photoImageView, likeButton].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
    }
    
    // MARK: - Methods
    @objc
    private func likeButtonTapped() {
        isLiked.toggle()
        likeButtonAction?()
    }
    
    private func updateUI() {
        let image = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: image), for: .normal)
    }
    
    func bind(_ photo: Photo) {
        photoImageView.image = photo.image
        isLiked = photo.isLiked
        updateUI()
    }
}
