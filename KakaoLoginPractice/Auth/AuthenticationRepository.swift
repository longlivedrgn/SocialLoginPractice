//
//  AuthenticationRepository.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import RxSwift

final class AuthenticationRepository {

    enum AuthenticationOption {
        case accessToken
        case refreshToken
    }

    private let networkService: NetworkService
    // Network 객체

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchToken() -> Token {
        let accessToken = TokenStorage.shared.read(.accessToken)
        let refreshToken = TokenStorage.shared.read(.refreshToken)

        return Token(accessToken: accessToken, refreshToken: refreshToken)
    }

    func fetch(withProviderToken providerToken: String, provider: Provider) -> Observable<LoginResponseDTO> {
        let loginRouter: LoginRouter

        switch provider {
        case .kakao:
            loginRouter = LoginRouter.kakao(tokenDTO: LoginRequestDTO(accessToken: providerToken))
        case .apple:
            loginRouter = LoginRouter.apple(tokenDTO: LoginRequestDTO(accessToken: providerToken))
        }
        
        // Provider Token으로 서버와 통신해서 accessToken과 RefreshToken 받아오기
        return networkService.request(loginRouter)
            .do(onNext: { [weak self] loginResponseDTO in
                if let accessToken = loginResponseDTO.accessToken {
                    self?.save(accessToken: accessToken)
                }
                if let refreshToken = loginResponseDTO.refreshToken {
                    self?.save(refreshToken: refreshToken)
                }
            })
    }

    func write(token: Token) {
        if let accessToken = token.accessToken {
            TokenStorage.shared.write(.accessToken, value: accessToken)
        }

        if let refreshToken = token.refreshToken {
            TokenStorage.shared.write(.refreshToken, value: refreshToken)
        }
    }

    func remove(_ option: AuthenticationOption) {
        switch option {
        case .accessToken:
            TokenStorage.shared.delete(.accessToken)
        case .refreshToken:
            TokenStorage.shared.delete(.refreshToken)
        }
    }

    private func save(accessToken: String) {
        TokenStorage.shared.write(.accessToken, value: accessToken)
    }

    private func save(refreshToken: String) {
        TokenStorage.shared.write(.refreshToken, value: refreshToken)
    }

}
