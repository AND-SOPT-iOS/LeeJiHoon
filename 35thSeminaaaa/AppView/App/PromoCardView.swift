//
//  PromoCardView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct PromotionSection: View {
    private let promotions = PromotionBanner.samplePromotions
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("지금 이용 가능")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                .padding(.leading, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(promotions) { promotion in
                        VStack(alignment: .leading) {
                            // Title and subtitle
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
                        .frame(width: 300, height: 200)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.vertical, 4)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    PromotionSection()
        .preferredColorScheme(.light)
}
