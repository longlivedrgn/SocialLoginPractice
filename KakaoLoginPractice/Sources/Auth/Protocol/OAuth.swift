//
//  OAuth.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import RxSwift

protocol OAuth {
    func authorize() -> Observable<OAuthResponse>
}
