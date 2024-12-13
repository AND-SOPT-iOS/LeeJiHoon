//
//  HobbyResponse.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//

import Foundation

struct HobbyResponse: Decodable {
    let result: HobbyResult?
    let code: String?
}

struct HobbyResult: Decodable {
    let hobby: String
}
