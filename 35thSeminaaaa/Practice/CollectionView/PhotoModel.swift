//
//  PhotoModel.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 10/26/24.
//

import UIKit

struct Photo {
    let image: UIImage
    var isLiked: Bool
}

extension Photo {
    static let mockData: [Photo] = [
        Photo(image: UIImage(systemName: "figure.walk")!, isLiked: false),
        Photo(image: UIImage(named: "toss")!, isLiked: true),
        Photo(image: UIImage(named: "toss")!, isLiked: false),
        Photo(image: UIImage(systemName: "figure.walk")!, isLiked: true),
        Photo(image: UIImage(systemName: "figure.walk")!, isLiked: false),
        Photo(image: UIImage(named: "toss")!, isLiked: false),
        Photo(image: UIImage(systemName: "figure.walk")!, isLiked: true),
        Photo(image: UIImage(named: "toss")!, isLiked: false),
        Photo(image: UIImage(systemName: "figure.walk")!, isLiked: true),
        Photo(image: UIImage(named: "toss")!, isLiked: false)
    ]
}
