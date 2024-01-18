//
//  ServiceAPI.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import Moya

protocol ServiceRouter: TargetType {

    associatedtype Response: Decodable
}

extension ServiceRouter {
    
    // 여기에 AccessToken이 extension으로 구현될 예정!..
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    var baseURL: URL { URL(string: "http://app/papi/v1/")! }
    var sampleData: Data { Data() }
}
