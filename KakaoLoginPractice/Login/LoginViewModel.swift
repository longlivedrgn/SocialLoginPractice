//
//  LoginViewModel.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import RxSwift

final class LoginViewModel {

    private let delegate: AuthenticationDelegate
    private let authenticationRepository: AuthenticationRepository
    private let oauthRepository: OAuthRepository
    private let keychain: Keychain

    private let disposeBag = DisposeBag()

    init(
        delegate: AuthenticationDelegate,
        authenticationRepository: AuthenticationRepository,
        oauthRepository: OAuthRepository,
        keychain: Keychain
    ) {
        self.delegate = delegate
        self.authenticationRepository = authenticationRepository
        self.oauthRepository = oauthRepository
        self.keychain = keychain
    }

    func signIn(with provider: Provider) {
        // Kakao API를 통해서 받은 Token을 서버에게 보내고, 서버에게 받은 토큰을 저장하기!..

    }

}
