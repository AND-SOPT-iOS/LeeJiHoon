//
//  PromoCardView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct PromoCardView: View {
    let promotion: PromotionBanner
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(promotion.title)
                .font(.subheadline)
            Text(promotion.subtitle)
                .font(.title3)
                .bold()
                .padding(.top, 1)
            
            HStack {
                Image("kakaopay.logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("업데이트")
                    .font(.system(size: 14))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
            }
            .padding(.top, 8)
        }
        .padding(20)
        .frame(width: 300, height: 200)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}
