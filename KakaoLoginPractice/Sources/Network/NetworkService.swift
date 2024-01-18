//
//  NetworkService.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import RxSwift
import RxMoya
import Moya
import UIKit

final class NetworkService {

    private var token: Token?
    private let provider = MoyaProvider<MultiTarget>(session: Session(interceptor: AuthenticationInterceptor()))
    private weak var authenticationRepository: AuthenticationRepository?

    private let disposeBag = DisposeBag()

    // 아래를 Some과 Any로 바꿀 수는 없을까?..
//    func request<Router: ServiceRouter>(_ router: Router) -> Observable<Router.Response> {
//        return self._request(router)
//            .catch({ [weak self] (error: Error) -> Observable<ServerResponseDTO<Router.Response>> in
//                guard let self, let error = error as? NetworkError else { throw error }
//
//                switch error {
//                case .accessTokenInvalidate: // access token 만료다.. -> refresh token으로 던지기!..
//                    return self.refreshAuthentication()
//                        .do { loginResponseDTO in
//                            // DTO에서 뽑아낸 accessToken과 refreshToken을 AuthenticationRepository의 keychain에 저장하기
//                            let token = Token(accessToken: loginResponseDTO.accessToken, refreshToken: loginResponseDTO.refreshToken)
//                            self.authenticationRepository?.write(token: token)
//                        }
//                        .flatMap { _ in return self._request(router) }
//                        .catch { [weak self] error in
//                            // error가 발생했으면 refresh까지 만료가 된 것이다.
//                            // 그래서 로그아웃을 시켜버리고 RootView로 옮긴다!..
//                            // 토큰 정보를 없애버리기
//                            self?.authenticationRepository?.remove(.accessToken)
//                            self?.authenticationRepository?.remove(.refreshToken)
//                            
//                            // rootView로 다시 되돌아가기!..
//                            let appDelegate = UIApplication.shared.delegate as? AppDelegate
//                            appDelegate?.window?.rootViewController = RootDIContainer().createRootViewController()
//                            return .empty()
//                        }
//                default:
//                    throw error
//                }
//            })
//            .compactMap { $0.data }
//    }

    private func request<Router: ServiceRouter>(_ router: Router) -> Observable<ServerResponseDTO<Router.Response>> {
        let endPoint = MultiTarget.target(router)
        return self.provider.rx.request(endPoint)
            .asObservable()
            .map(ServerResponseDTO<Router.Response>.self)
    }
}
