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
    let id: Int
    let headerTitle: String
    let mainTitle: String
    let subTitle: String
    let image: String
    let appIconName: String
    let description: String
}
extension CategoryItem {
    static let sampleCategories: [CategoryItem] = [
        CategoryItem(title: "엔터테인먼트", icon: "calendar"),
        CategoryItem(title: "소셜 네트워킹", icon: "arkit"),
        CategoryItem(title: "사진 및 비디오", icon: "book.fill"),
        CategoryItem(title: "생산성", icon: "tv.fill"),
        CategoryItem(title: "라이프스타일", icon: "fork.knife"),
        CategoryItem(title: "쇼핑", icon: "gamecontroller.fill"),
        CategoryItem(title: "그뮹", icon: "heart.fill"),
        CategoryItem(title: "개발자도구", icon: "figure.walk")
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
            id: 1,
            headerTitle: "지금 이용 가능",
            mainTitle: "TVING",
            subTitle: "핀란드 셋방살이",
            image: "AppNowExam",
            appIconName: "toss",
            description: "즐겨움을 스트리밍하세요"
        ),
        PromotionBanner(
            id: 2,
            headerTitle: "지금 이용 가능",
            mainTitle: "TVING",
            subTitle: "핀란드 셋방살이",
            image: "AppNowExam",
            appIconName: "toss",
            description: "즐겨움을 스트리밍하세요"
        ),
        PromotionBanner(
            id: 3,
            headerTitle: "지금 이용 가능",
            mainTitle: "TVING",
            subTitle: "핀란드 셋방살이",
            image: "AppNowExam",
            appIconName: "toss",
            description: "즐겨움을 스트리밍하세요"
        ),
        PromotionBanner(
            id: 4,
            headerTitle: "지금 이용 가능",
            mainTitle: "TVING",
            subTitle: "핀란드 셋방살이",
            image: "AppNowExam",
            appIconName: "toss",
            description: "즐겨움을 스트리밍하세요"
        ),
    ]
}
