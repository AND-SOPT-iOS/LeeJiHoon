//
//  ArcadeView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct ArcadeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("알림 화면")
                    .font(.largeTitle)
            }
            .navigationTitle("알림")
        }
    }
}
#Preview {
    ArcadeView()
}
