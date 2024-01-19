//
//  OAuthRepository.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import RxSwift

protocol OAuthRepository {
    func authorize(provider: Provider) -> Observable<OAuthResponse>
}

final class BooltiOAuthRepository: OAuthRepository {

    func authorize(provider: Provider) -> Observable<OAuthResponse> {
        var OAuth: OAuth
        
        switch provider {
        case .kakao:
            OAuth = KakaoAuth()
        case .apple:
            OAuth = AppleAuth()
        }
        return OAuth.authorize()
    }

}
