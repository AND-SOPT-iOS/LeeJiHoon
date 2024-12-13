//
//  GameView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("검색 화면")
                    .font(.largeTitle)
            }
            .navigationTitle("검색")
        }
    }
}


#Preview {
    GameView()
}
