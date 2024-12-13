//
//  UserService.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//

import Foundation
import Alamofire

final class NetworkService {
    // MARK: - Request methods
    static func register(username: String, password: String, hobby: String, completion: @escaping (Result<RegisterResponse, Error>) -> Void) {
        let urlString = Environment.baseURL + "/user"
        print("Register URL: \(urlString)")
        
        let parameters = RegisterRequest(username: username, password: password, hobby: hobby)
        
        AF.request(urlString,
                  method: .post,
                  parameters: parameters,
                  encoder: JSONParameterEncoder.default)
        .responseDecodable(of: RegisterResponse.self) { response in
            switch response.result {
            case .success(let registerResponse):
                completion(.success(registerResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func login(username: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let urlString = Environment.baseURL + "/login"
        
        let parameters = LoginRequest(username: username, password: password)
        
        AF.request(urlString,
                  method: .post,
                  parameters: parameters,
                  encoder: JSONParameterEncoder.default)
        .responseDecodable(of: LoginResponse.self) { response in
            switch response.result {
            case .success(let loginResponse):
                completion(.success(loginResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getMyHobby(token: String, completion: @escaping (Result<HobbyResponse, Error>) -> Void) {
        let urlString = Environment.baseURL + "/user/my-hobby"
        
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(urlString,
                  method: .get,
                  headers: headers)
        .responseDecodable(of: HobbyResponse.self) { response in
            switch response.result {
            case .success(let hobbyResponse):
                completion(.success(hobbyResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getOtherHobby(userNo: Int, token: String, completion: @escaping (Result<HobbyResponse, Error>) -> Void) {
        let urlString = Environment.baseURL + "/user/\(userNo)/hobby"
        
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(urlString,
                  method: .get,
                  headers: headers)
        .responseDecodable(of: HobbyResponse.self) { response in
            switch response.result {
            case .success(let hobbyResponse):
                completion(.success(hobbyResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func updateUser(token: String, password: String? = nil, hobby: String? = nil, completion: @escaping (Result<HobbyResponse, Error>) -> Void) {
        let urlString = Environment.baseURL + "/user"
        
        let headers: HTTPHeaders = ["token": token]
        let parameters = UpdateUserRequest(password: password, hobby: hobby)
        
        AF.request(urlString,
                  method: .put,
                  parameters: parameters,
                  encoder: JSONParameterEncoder.default,
                  headers: headers)
        .responseDecodable(of: HobbyResponse.self) { response in
            switch response.result {
            case .success(let updateResponse):
                completion(.success(updateResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
