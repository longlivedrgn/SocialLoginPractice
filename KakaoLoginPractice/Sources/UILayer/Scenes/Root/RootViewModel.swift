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
    
    // 맨 처음은 Splash ViewController로 이동하게 된다.
    let navigation = BehaviorRelay<Navigation>(value: .present(RootDestination.splash, animated: false))

    func signIn(token: Token) {
        // 해당 함수가 실행되면 signedIn -> Home 화면으로 navigate이 된다.
        navigation.accept(.present(RootDestination.signedIn(token: token), animated: false))
    }

    func notSignIn() {
        // 해당 함수가 실행되면 signedOut -> Login 화면으로 navigate된다.
        navigation.accept(.present(RootDestination.signedOut))
    }

}
