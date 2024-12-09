//
//  PromotionCardContainer.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/9/24.
//

import SwiftUI

struct PromotionCardContainer: View {
    let promotion: PromotionBanner
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(promotion.headerTitle)
                .font(.system(size: 14))
                .foregroundColor(.blue)
            
            Text(promotion.mainTitle)
                .font(.system(size: 28))
                .foregroundColor(.black)
            
            Text(promotion.subTitle)
                .font(.system(size: 24))
                .foregroundColor(.gray)
                .padding(.bottom, 8)
            
            PromotionCard(
                promotion: promotion,
                cardWidth: cardWidth,
                cardHeight: cardHeight
            )
        }
    }
}
