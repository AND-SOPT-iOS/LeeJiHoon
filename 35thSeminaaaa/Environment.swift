//
//  Environment.swift
//  35thSeminaaaa
//
//  Created by 이지훈 on 11/2/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
