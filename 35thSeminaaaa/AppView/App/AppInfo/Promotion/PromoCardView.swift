//
//  PromoCardView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct PromotionCard: View {
    let promotion: PromotionBanner
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            backgroundImage
            gradientOverlay
            bottomContent
        }
        .frame(width: cardWidth, height: cardHeight)
        .background(Color.white)
        .cornerRadius(12)
    }
    
    private var backgroundImage: some View {
        Image(promotion.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: cardWidth, height: cardHeight)
            .clipped()
    }
    
    private var gradientOverlay: some View {
        VStack(spacing: 0) {
            Spacer()
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0),
                    Color.black.opacity(0.7)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: cardHeight * 0.3)
        }
    }
    
    private var bottomContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer()
            HStack(spacing: 12) {
                Image(promotion.appIconName)
                    .resizable()
                    .frame(width: 28, height: 28)
                    .cornerRadius(6)
                
                Button(action: {}) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(promotion.appIconName)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Text(promotion.description)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(16)
    }
}
