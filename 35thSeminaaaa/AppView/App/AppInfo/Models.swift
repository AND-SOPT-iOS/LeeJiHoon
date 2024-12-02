//
//  Models.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import Foundation

struct AppInfo: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let iconName: String
}

struct PromotionBanner: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

extension AppInfo {
    static let sampleRecommendedApps: [AppInfo] = [
        AppInfo(
            name: "토스",
            description: "금융이 쉬워진다",
            iconName: "toss.icon"
        ),
        AppInfo(
            name: "네이버페이",
            description: "결제·포인트·대출·보험·카드·증권·부동산까지 하나로",
            iconName: "naverpay.icon"
        ),
        AppInfo(
            name: "카카오페이",
            description: "금융의 다른 길",
            iconName: "kakaopay.icon"
        )
    ]
    
    static let sampleApp = AppInfo(
        name: "토스",
        description: "금융이 쉬워진다",
        iconName: "toss.icon"
    )
}

extension PromotionBanner {
    static let samplePromotions: [PromotionBanner] = [
        PromotionBanner(
            title: "카카오페이",
            subtitle: "간편하게 결제하고, 특별한 혜택을 챙기세요",
            imageName: "kakao.promo"
        )
    ]
    
    static let samplePromotion = PromotionBanner(
        title: "카카오페이",
        subtitle: "간편하게 결제하고, 특별한 혜택을 챙기세요",
        imageName: "kakao.promo"
    )
}
