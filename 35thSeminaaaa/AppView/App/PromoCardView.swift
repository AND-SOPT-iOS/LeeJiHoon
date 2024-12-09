//
//  PromoCardView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct PromotionSection: View {
    private let promotions = PromotionBanner.samplePromotions
    
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
            VStack(alignment: .leading, spacing: 4) {
                Text("지금 이용 가능")
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
                    .padding(.leading, 16)
                Text("TVING")
                    .font(.system(size: 28))
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                Text("핀란드 셋방살이")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)

                HStack(spacing: 16) {
                    ForEach(promotions) { promotion in
                        ZStack(alignment: .bottomLeading) {
                            Image("AppNowExam")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: cardWidth, height: cardHeight)
                                .clipped()
                            
                            HStack(spacing: 12) {
                                Image("toss")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .cornerRadius(6)
                                
                                Button(action: {}) {
                                    Text("즐겨움을 스트리밍하세요")
                                        .font(.system(size: 12))
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(15)
                                }
                            }
                            .padding(16)
                        }
                        .frame(width: cardWidth, height: cardHeight)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
                    }
                }
                .padding(.leading, 16)
            }
        }
    }
}

#Preview {
    PromotionSection()
        .preferredColorScheme(.light)
}
