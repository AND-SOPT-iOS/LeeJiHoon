//
//  AppDelegate.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 10/12/24.
//

import SwiftUI

@main
struct AndSoptSemina: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
