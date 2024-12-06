//
//  Models.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import Foundation

struct CategoryItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
}

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

extension CategoryItem {
    static let sampleCategories: [CategoryItem] = [
        CategoryItem(title: "이번 주", icon: "calendar"),
        CategoryItem(title: "AR", icon: "arkit"),
        CategoryItem(title: "교육", icon: "book.fill"),
        CategoryItem(title: "엔터테인먼트", icon: "tv.fill"),
        CategoryItem(title: "음식", icon: "fork.knife"),
        CategoryItem(title: "게임", icon: "gamecontroller.fill"),
        CategoryItem(title: "건강", icon: "heart.fill"),
        CategoryItem(title: "라이프스타일", icon: "figure.walk")
    ]
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
