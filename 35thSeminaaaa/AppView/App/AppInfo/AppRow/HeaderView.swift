//
//  HeaderView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/9/24.
//

import SwiftUI

struct SectionHeaderView: View {
    let title: String
    var showSeeAll: Bool = true
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
            if showSeeAll {
                Button("모두 보기") {

                }
                .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
    }
}
