//
//  ContentView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI



struct ContentView: View {
    // 현재 선택된 탭을 추적하기 위한 상태 변수
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TodayView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
                .tag(0)
            
            GameView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(1)
            
            AppView()
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("게시물")
                }
                .tag(2)
            
            ArcadeView()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("알림")
                }
                .tag(3)
            
            SearchView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("프로필")
                }
                .tag(4)
        }
        .accentColor(.blue) 
    }
}

#Preview {
    ContentView()
}
