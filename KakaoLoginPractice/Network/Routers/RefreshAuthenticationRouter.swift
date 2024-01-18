//
//  RefreshAuthenticationRouter.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import Moya

enum RefreshAuthenticationRouter {

    typealias Response = LoginResponseDTO

    case refresh(token: String)
}

extension RefreshAuthenticationRouter: ServiceRouter {

    // API 명세에 따라서 달라질 예정!..
    var path: String { "/token-refresh" }
    var method: Moya.Method { .post }
    var headers: [String : String]? { [:] }
    var task: Task {
        switch self {
        case .refresh(let refreshToken):
            return .requestParameters(parameters: ["refreshToken": refreshToken], encoding: URLEncoding.queryString)
        }
    }
}
