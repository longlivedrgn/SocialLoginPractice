//
//  AuthenticationDelegate.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation

protocol AuthenticationDelegate {
    func signIn(token: Token)
    func notSignIn()
}
