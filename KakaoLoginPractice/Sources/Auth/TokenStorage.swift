//
//  TokenStorage.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation

enum PersistanceKey: String {
    case accessToken
    case refreshToken
}

class TokenStorage {

    static let shared = TokenStorage()

    private init() {}

    // UserDefaults에서 읽어오기
    func read(_ key: PersistanceKey) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }

    // 저장하기
    func write(_ key: PersistanceKey, value: String) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }

    // 삭제하기
    func delete(_ key: PersistanceKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }

}
