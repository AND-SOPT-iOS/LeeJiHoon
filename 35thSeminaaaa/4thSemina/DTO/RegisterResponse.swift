//
//  RegisterResponse.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//

import Foundation

struct RegisterRequest: Encodable {
    let username: String
    let password: String
    let hobby: String
}

struct RegisterResponse: Decodable {
    let result: RegisterResult?
    let code: String?
}

struct RegisterResult: Decodable {
    let no: Int
}
