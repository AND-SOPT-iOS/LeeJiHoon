//
//  AppViewModel.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published var categories: [CategoryItem] = []
    @Published var recommendedApps: [AppInfo] = []
    @Published var promotions: [PromotionBanner] = []
    
    var showDetailVC : ((AppInfo) -> Void)?
    
    init() {
        loadData()
    }
    
    func showDetail(app: AppInfo) {
        showDetailVC?(app)
    }
    
    private func loadData() {
        categories = CategoryItem.sampleCategories
        recommendedApps = AppInfo.sampleRecommendedApps
        promotions = PromotionBanner.samplePromotions
    }
}
