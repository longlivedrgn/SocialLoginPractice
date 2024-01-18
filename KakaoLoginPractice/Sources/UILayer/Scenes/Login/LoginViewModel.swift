//
//  LoginViewModel.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import RxSwift
import RxMoya
import Moya

final class LoginViewModel {

    private let delegate: AuthenticationDelegate
    private let authenticationRepository: AuthenticationRepository
    private let OAuthRepository: OAuthRepository

    private let disposeBag = DisposeBag()

    init(
        delegate: AuthenticationDelegate,
        authenticationRepository: AuthenticationRepository,
        OAuthRepository: OAuthRepository
    ) {
        self.delegate = delegate
        self.authenticationRepository = authenticationRepository
        self.OAuthRepository = OAuthRepository
    }

    func signIn(with provider: Provider) {
        // Kakao API를 통해서 받은 Token을 서버에게 보내고, 서버에게 받은 토큰을 저장하기!..
        self.OAuthRepository.authorize(provider: provider)
            .flatMapLatest { [weak self] OAuthReponse -> Observable<LoginResponseDTO> in
                guard let self = self else { return .empty() }

                return self.authenticationRepository.fetch(withProviderToken: OAuthReponse.accessToken, provider: OAuthReponse.provider)
            }
            .catch { error in
                // Error Handling해야함!..
                return .empty()
            }
            .bind { [weak self] loginResponseDTO in
                guard let self else { return }
                
                let token = Token(accessToken: loginResponseDTO.accessToken, refreshToken: loginResponseDTO.refreshToken)

                self.authenticationRepository.write(token: token) // 로컬에 서버에서 받아온 token들 저장하기
                self.delegate.signIn(token: token)
            }
            .disposed(by: self.disposeBag)
    }
}
