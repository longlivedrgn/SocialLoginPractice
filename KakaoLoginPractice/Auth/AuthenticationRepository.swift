//
//  AuthenticationRepository.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation

final class AuthenticationRepository {
    // LocalStorage => Keychain
    private let keychain: Keychain
    private let networkService: NetworkService
    // Network 객체

    init(keyChain: Keychain, networkService: NetworkService) {
        self.keychain = keyChain
        self.networkService = networkService
    }

}
