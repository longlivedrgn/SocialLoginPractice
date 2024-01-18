//
//  NetworkError.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation

enum NetworkError: Error, Equatable {

    case hasNotRefreshToken
    case accessTokenInvalidate
    case denyAuthentication
    case unknown(_ code: Int, _ message: String?)
    case request
    case decoding
}

