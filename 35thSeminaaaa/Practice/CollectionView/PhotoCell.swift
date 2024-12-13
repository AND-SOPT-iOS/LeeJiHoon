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
        $0.backgroundColor = .systemGray6
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .systemRed
        $0.backgroundColor = .white.withAlphaComponent(0.7)
        $0.layer.cornerRadius = 15
        $0.imageView?.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [photoImageView, likeButton].forEach { contentView.addSubview($0) }
        backgroundColor = .clear
    }
    
    private func setLayout() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(30)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        isLiked = false
    }
    
    @objc private func didTapLikeButton() {  
        isLiked.toggle()
        likeButtonAction?()
        
        UIView.animate(withDuration: 0.1, animations: {
            self.likeButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.likeButton.transform = .identity
            }
        }
    }
    
    private func updateUI() {
        let imageName = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
    func bind(_ photo: Photo) {
        photoImageView.image = photo.image
        isLiked = photo.isLiked
        updateUI()
    }
}
