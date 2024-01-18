//
//  MoyaProvider+.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import Moya

extension MoyaProvider {

    func judgeStatus<T: Decodable>(by statusCode: Int?, _ data: Data?, _ type: T.Type) -> Result<ServerResponseDTO<T>, NetworkError> {
        let decoder = JSONDecoder()

        guard let statusCode, let data else { return .failure(.request)}
        guard let decodedData = try? decoder.decode(ServerResponseDTO<T>.self, from: data) else {
            return .failure(.decoding)
        }
        
        switch statusCode {
        case 200...210:
            return .success(decodedData)
        case 401:
            return .failure(.accessTokenInvalidate)
        case 404:
            return .failure(.request)
        default:
            return .failure(.unknown(statusCode, decodedData.message))
        }
    }
}
