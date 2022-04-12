//
//  APIResponse.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation

struct APIResponse: Decodable {
    let result: String
    let success: Bool
    let reason: String
}
