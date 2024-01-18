//
//  OAuthRepository.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import RxSwift

final class OAuthRepository {
    
    func authorize(provider: Provider) -> Observable<OAuthResponse> {
        var OAuth: OAuth

        switch provider {
        case .kakao:
            OAuth = KakaoAuth()
        case .apple:
//            response = AppleAuth()
            print("It's Apple")
        }
        return OAuth.authorize()
    }

}
