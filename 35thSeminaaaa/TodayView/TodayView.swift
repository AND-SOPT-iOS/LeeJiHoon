//
//  TodayView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("홈 화면")
                    .font(.largeTitle)
            }
            .navigationTitle("홈")
        }
    }
}
#Preview {
    TodayView()
}
