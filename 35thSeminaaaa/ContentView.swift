//
//  ContentView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            TodayView()
            
                .tabItem {
                    Image(systemName: "book.pages")
                    Text("투데이")
                }
                .tag(0)
            
            GameView()
            
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("게임")
                }
                .tag(1)
            
            NavigationView {
                AppView()
            }
            .tabItem {
                Image(systemName: "square.stack.3d.up")
                Text("앱")
            }
            .tag(2)
            
            
            ArcadeView()
            
                .tabItem {
                    Image(systemName: "arcade.stick.console")
                    Text("Arcade")
                }
                .tag(3)
            
            
            SearchView()
            
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(4)
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
