//
//  SwiftUIView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/27/24.
//

import SwiftUI
import UIKit

struct AppRankingView: View {

    weak var navigationController: UINavigationController?
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            pickerView
            
            List {
                ForEach(selectedTab == 0 ? AppData.freeApps : AppData.paidApps) { app in
                    appListItem(app)
                }
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.black)
    }
    
    private var pickerView: some View {
        Picker("앱 종류", selection: $selectedTab) {
            Text("무료 앱").tag(0)
            Text("유료 앱").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    private func appListItem(_ app: AppInfo) -> some View {
        Button(action: {
            let tossVC = TossViewcontroller()
            tossVC.view.backgroundColor = .black
            navigationController?.pushViewController(tossVC, animated: true)
        }) {
            HStack {
                rankLabel(app.rank)
                appIcon(iconName: app.appIcon, systemIcon: app.iconName)
                appInfoStack(name: app.name, description: app.description)
                Spacer()
                actionButton(type: app.buttonType)
            }
            .padding(.vertical, 4)
        }
        .listRowBackground(Color.black)
    }
    
    private func rankLabel(_ rank: Int) -> some View {
        Text("\(rank)")
            .font(.headline)
            .frame(width: 30)
            .foregroundColor(.white)
    }
    
    private func appIcon(iconName: String, systemIcon: String) -> some View {
        Group {
            if let image = UIImage(named: iconName) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
            } else {
                Image(systemName: systemIcon)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
            }
        }
    }
    
    private func appInfoStack(name: String, description: String) -> some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
                .foregroundColor(.white)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 8)
    }
    
    private func actionButton(type: ButtonType) -> some View {
        Group {
            switch type {
            case .update:
                Text("업데이트")
            case .receive, .download:
                Text("받기")
            case .cloud:
                Image(systemName: "icloud.and.arrow.down")
            }
        }
        .foregroundColor(.blue)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(15)
    }

}

// MARK: - Preview
#Preview {
    AppRankingView()
}
