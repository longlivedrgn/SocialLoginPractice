//
//  LoginAPI.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import Moya

enum LoginRouter {

    typealias Response = LoginResponseDTO

    case kakao(tokenDTO: LoginRequestDTO)
    case apple(tokenDTO: LoginRequestDTO)
}

extension LoginRouter: ServiceRouter {
    // 🔥 아래는 API 명세서에 따라서 수정될 예정!.

    var path: String {
        switch self {
        case .kakao(_):
            return "/login/kakao"
        case .apple(_):
            return "/login/appleid"
        }
    }

    var task: Task {
        switch self {
        case .kakao(let DTO):
            return .requestParameters(parameters: ["accessToken": DTO.accessToken], encoding: URLEncoding.queryString)
        case .apple(let DTO):
            return .requestParameters(parameters: ["accessToken": DTO.accessToken], encoding: URLEncoding.queryString)
        }
    }

    var method: Moya.Method { .post }
}
