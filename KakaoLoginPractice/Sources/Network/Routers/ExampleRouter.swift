//
//  ExampleRouter.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import Moya

enum OpenWeather: ServiceRouter {
    typealias Response = WeatherDTO
    
    case weather
}

extension OpenWeather: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.rg")!
    }
    
    var path: String {
        return "/data/2.5/weather"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        return .requestParameters(parameters: ["appid": "4f3dd2b18f5cbe2193fdace58393160c", "units": "metric", "lat": "37.5", "lon": "127"], encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return [:]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}
