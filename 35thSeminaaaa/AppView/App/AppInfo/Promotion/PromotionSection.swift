//
//  PromotionSection.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/9/24.
//

import SwiftUI

struct PromotionSection: View {
    let promotions: [PromotionBanner]
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    private var cardWidth: CGFloat {
        screenWidth - (16 + 30)
    }
    
    private var cardHeight: CGFloat {
        cardWidth * (9/16)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(promotions) { promotion in
                    PromotionCardContainer(
                        promotion: promotion,
                        cardWidth: cardWidth,
                        cardHeight: cardHeight
                    )
                }
            }
            .padding(.leading, 16)
        }
    }
}
