//
//  LoginResponse.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//



struct LoginRequest: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    let result: LoginResult?
    let code: String?
}

struct LoginResult: Decodable {
    let token: String
}
