//
//  OAuthReponse.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation

enum Provider: String {
    case apple
    case kakao
}

struct OAuthResponse {
    let accessToken: String
    let provider: Provider
}
