//
//  AppViewModel.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

class AppViewModel: ObservableObject {
    let categories = ["엔터테인먼트", "소셜 네트워킹", "사진 및 비디오"]
    
    @Published var recommendedApps: [AppInfo] = []
    @Published var promotions: [PromotionBanner] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
        recommendedApps = AppInfo.sampleRecommendedApps
        promotions = PromotionBanner.samplePromotions
    }
}
