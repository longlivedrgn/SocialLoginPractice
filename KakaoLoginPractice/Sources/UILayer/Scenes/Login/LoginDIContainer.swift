//
//  LoginDIContainer.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation

final class LoginDIContainer {

    let rootViewModel: RootViewModel
    let authenticationRepository: AuthenticationRepository

    init(rootDIContainer: RootDIContainer) {
        self.rootViewModel = rootDIContainer.rootViewModel
        self.authenticationRepository = rootDIContainer.authenticationRepository
    }

    func createLoginViewController() -> LoginViewController {
        let viewController = LoginViewController()
        viewController.viewModel = createLoginViewModel()
        return viewController
    }

    private func createLoginViewModel() -> LoginViewModel {
        let OAuthRepository = BooltiOAuthRepository()
        return LoginViewModel(delegate: rootViewModel, authenticationRepository: authenticationRepository, OAuthRepository: OAuthRepository)
    }

}
