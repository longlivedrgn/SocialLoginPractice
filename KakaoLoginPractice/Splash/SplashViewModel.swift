//
//  SplashViewModel.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import RxSwift

final class SplashViewModel {

    private let authenticationRepository: AuthenticationRepository
    private let authenticationDelegate: AuthenticationDelegate

    private let disposeBag = DisposeBag()


    init(authenticationRepository: AuthenticationRepository, authenticationDelegate: AuthenticationDelegate) {
        self.authenticationRepository = authenticationRepository
        self.authenticationDelegate = authenticationDelegate
    }

    func loadAccessToken() {
        // Keychain에서 Token 읽어오기!..
        // 그리고 Token이 있으면 delegate으로 signedIn
        // 없으면 notSignIn으로

    }

}
