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
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

