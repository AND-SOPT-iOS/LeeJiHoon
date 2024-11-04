//
//  UpdateRequest.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//

import Foundation

struct UpdateUserRequest: Encodable {
    let password: String?
    let hobby: String?
}
