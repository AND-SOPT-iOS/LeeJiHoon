//
//  AppView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("게시물 작성")
                    .font(.largeTitle)
            }
            .navigationTitle("게시물")
        }
    }
}

#Preview {
    AppView()
}
