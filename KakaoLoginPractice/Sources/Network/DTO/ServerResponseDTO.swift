//
//  ServerResponse.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation

struct ServerResponseDTO<T: Decodable>: Decodable {

    let statusCode: Int?
    let data: T?
    let message: String?
}
