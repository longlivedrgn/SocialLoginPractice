//
//  LoginResponseDTO.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation

struct LoginResponseDTO: Decodable {
    
    let signUpRequired: Bool
    let accessToken: String?
    let refreshToken: String?
}
