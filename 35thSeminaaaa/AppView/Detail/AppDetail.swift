//
//  AppDetail.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct AppDetailView: View {
    let app: AppInfo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 16) {
                    Image(app.iconName)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(24)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(app.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(app.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // 다운로드 버튼
                Button(action: {}) {
                    Text("받기")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                }
            }
            .padding(20)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
