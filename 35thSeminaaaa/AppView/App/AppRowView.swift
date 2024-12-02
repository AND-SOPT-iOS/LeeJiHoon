//
//  AppRowView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct AppRowView: View {
    let app: AppInfo
    
    var body: some View {
        HStack(spacing: 16) {
            Image(app.iconName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(app.name)
                    .font(.system(size: 16, weight: .semibold))
                Text(app.description)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("열기")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.blue)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(16)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
