//
//  RootViewModel.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation
import RxRelay

enum RootDestination: Destination {
    case splash
    case signedOut
    case signedIn(token: Token)
}

final class RootViewModel: AuthenticationDelegate {

    let navigation = BehaviorRelay<Navigation>(value: .present(RootDestination.splash, animated: false))

    func signIn(token: Token) {
        navigation.accept(.present(RootDestination.signedIn(token: token), animated: false))
    }

    func notSignIn() {
        navigation.accept(.present(RootDestination.signedOut))
    }

}
