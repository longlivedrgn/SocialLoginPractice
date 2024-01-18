//
//  AppleAuth.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import RxSwift
import RxKakaoSDKAuth
import KakaoSDKAuth
import KakaoSDKUser
import RxKakaoSDKUser

struct AppleAuth: OAuth {

    private let disposeBag = DisposeBag()

    private enum AppleAuthError: Error {
        case invalidToken
    }

    func authorize() -> Observable<OAuthResponse> {
        return Observable<OAuthResponse>.create { observer in
            return Disposables.create()
        }
    }
}
