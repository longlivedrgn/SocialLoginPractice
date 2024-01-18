//
//  Navigation.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation


enum NavigationAction: Equatable {
    case present(animated: Bool = true)
    case push
}

struct Navigation {

    let action: NavigationAction
    let destination: Destination

    static func present(_ destination: Destination, animated: Bool = true) -> Self {
        return Navigation(action: NavigationAction.present(animated: animated), destination: destination)
    }

    static func push(_ destination: Destination) -> Self {
        return Navigation(action: NavigationAction.push, destination: destination)
    }

}
