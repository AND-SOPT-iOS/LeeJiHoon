//
//  AppView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct AppView: View {
    @StateObject private var viewModel = AppViewModel()
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack(alignment: .leading, spacing: 20) {
                        categorySection
                        PromotionSection(promotions: viewModel.promotions)
                            .padding(.top, 8)
                        Divider()
                            .padding(.horizontal, 16)

                        appListSection
                    }
                    .padding(.horizontal, 0)
                }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) { value in
                withAnimation(.easeInOut) {
                    scrollOffset = value
                }
            }
            .navigationBarTitleDisplayMode(scrollOffset > -30 ? .large : .inline)
            .navigationTitle("앱")

        }
    }
    
    private var categorySection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(viewModel.categories) { category in
                    HStack(spacing: 6) {
                        Image(systemName: category.icon)
                            .font(.system(size: 12))
                        
                        Text(category.title)
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(
                        color: Color.black.opacity(0.1),
                        radius: 4,
                        x: 0,
                        y: 2
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
        }
        .padding(.vertical, 4)
    }
    
    private var appListSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading, spacing: 4) {
                SectionHeaderView(title: "iPhone 필수 앱")
                Text("에디터가 직접 고른 추천 앱으로 시작하세요")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                
                VStack(spacing: 0) {
                    ForEach(viewModel.recommendedApps) { app in
                        AppRowView(app: app)
                        if app.id != viewModel.recommendedApps.last?.id {
                            Divider()
                                .padding(.leading, 76)
                                .padding(.trailing, 16)
                        }
                    }
                }
            }
            
        }
        .padding(.top, 20)
    }

}

#Preview {
    NavigationView {
        AppView()
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
