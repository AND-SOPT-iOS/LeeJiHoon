//
//  SearchView.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 12/2/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("프로필 화면")
                    .font(.largeTitle)
            }
            .navigationTitle("프로필")
        }
    }
}

#Preview {
    SearchView()
}
