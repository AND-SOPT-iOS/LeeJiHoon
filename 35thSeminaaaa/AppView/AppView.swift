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
                            GeometryReader { geo in
                                Color.clear.preference(
                                    key: OffsetPreferenceKey.self,
                                    value: geo.frame(in: .named("scroll")).minY
                                )
                            }
                            .frame(height: 0)
                            
                            categorySection
                            promotionSection
                            appListSection
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(OffsetPreferenceKey.self) { value in
                    scrollOffset = value
                }
                .navigationBarTitleDisplayMode(scrollOffset > -30 ? .large : .inline)
                .navigationTitle("앱")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        profileButton
                    }
                }
            }
        }
    
    private var categorySection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(viewModel.categories, id: \.self) { category in
                    Text(category)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var promotionSection: some View {
        VStack(alignment: .leading) {
            Text("현재 진행 중")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.promotions) { promo in
                        PromoCardView(promotion: promo)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var appListSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("iPhone 필수 앱")
                    .font(.title2)
                    .bold()
                Spacer()
                Button("모두 보기") {
                }
                .foregroundColor(.blue)
            }
            .padding(.horizontal)
            
            VStack(spacing: 0) {
                ForEach(viewModel.recommendedApps) { app in
                    AppRowView(app: app)
                    Divider()
                        .padding(.leading, 76)
                }
            }
        }
    }
    
    private var profileButton: some View {
        Button(action: {}) {
            Image(systemName: "person.circle")
                .foregroundColor(.primary)
        }
    }
    
    
}

#Preview {
    NavigationView {
        ContentView()
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
