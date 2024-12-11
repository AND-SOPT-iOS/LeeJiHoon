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
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithDefaultBackground()
        
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground() 
        
        UINavigationBar.appearance().standardAppearance = standardAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
struct NavControllerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
