//
//  SpashDIContainer.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation

final class SplashDIContainer {

    let rootViewModel: RootViewModel
    let authenticationRepository: AuthenticationRepository

    init(rootDIContainer: RootDIContainer) {
        self.rootViewModel = rootDIContainer.rootViewModel
        self.authenticationRepository = rootDIContainer.authenticationRepository
    }

    func createSplashViewController() -> SplashViewController {
        let viewController = SplashViewController()
        viewController.viewModel = self.createSplashViewModel()
        return viewController
    }

    private func createSplashViewModel() -> SplashViewModel {

        let viewModel = SplashViewModel(
            authenticationRepository: authenticationRepository,
            authenticationDelegate: rootViewModel
        )
        return viewModel
    }
}
