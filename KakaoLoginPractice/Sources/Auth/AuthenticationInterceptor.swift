//
//  AuthenticationInterceptor.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import Alamofire
import Moya

class AuthenticationInterceptor: RequestInterceptor {

    let provider = MoyaProvider<RefreshAuthenticationRouter>()

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {

        var urlRequest = urlRequest
        // Token이 필요한 서버 통신일 경우!..
        // Prefix를 통해서 판단
        guard urlRequest.url?.absoluteString.hasPrefix("http://어쩌구") == true,
              let accessToken = TokenStorage.shared.read(.accessToken) // 기기에 저장된 토큰들
        else {
            completion(.success(urlRequest))
            return
        }

        // request header에 토큰을 넣는다.
        urlRequest.headers.add(.authorization(bearerToken: accessToken))
        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // HTTPResponse가 아닐 경우 에러 핸들링
        guard let response = request.task?.response as? HTTPURLResponse else {
            completion(.doNotRetryWithError(error))
            return
        }

        // 상태 코드가 401이 아닐 경우에는 Retry를 하지 않는다.
        guard response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }

        // 1. 서버에게 refresh token을 활용하여 다시 access token과 refresh token을 받아오기
        // 2. 받아온 토큰으로 다시 access token을 설정해서 retry를 시키기!..
        guard let refreshToken = TokenStorage.shared.read(.refreshToken) else {
            completion(.doNotRetryWithError(error))
            return
        }

        self.provider.request(RefreshAuthenticationRouter.refresh(token: refreshToken)) { result in
            switch result {
            case .success(let response):

                let decoder = JSONDecoder()
                guard let decodedData = try? decoder.decode(ServerResponseDTO<LoginResponseDTO>.self, from: response.data) else {
                    return
                }
                guard let accessToken = decodedData.data?.accessToken else { return }
                guard let refreshToken = decodedData.data?.refreshToken else { return }
                TokenStorage.shared.write(.accessToken, value: accessToken)
                TokenStorage.shared.write(.refreshToken, value: refreshToken)
                completion(.retry)
            case .failure(let error):
                completion(.doNotRetryWithError(error))
                // 로그인 화면으로 가야된다.
            }
        }
    }
}
