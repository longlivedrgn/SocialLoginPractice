//
//  RootDIContainer.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import Foundation

final class RootDIContainer {

    let rootViewModel: RootViewModel
    let authenticationRepository: AuthenticationRepository

    init() {
        self.rootViewModel = RootViewModel()
        self.authenticationRepository = BoolTiAuthenticationRepository(networkService: NetworkService())
    }

    func createRootViewController() -> RootViewController {
        let splashViewControllerFactory: () -> SplashViewController = {
            let DIContainer = self.createSplashDIContainer()
            return DIContainer.createSplashViewController()
        }

        let homeViewControllerFactory: (Token) -> HomeViewController = { (token: Token) in
            let DIContainer = self.createHomeDIContainer(token: token)
            return DIContainer.createHomeViewController()
        }

        let loginViewControllerFactory: () -> LoginViewController = {
            let DIContainer = self.createLoginDIContainer()
            return DIContainer.createLoginViewController()
        }

        return RootViewController(
            viewModel: rootViewModel,
            splashViewControllerFactory: splashViewControllerFactory,
            loginViewControllerFactory: loginViewControllerFactory,
            homeViewControllerFactory: homeViewControllerFactory
        )

    }

    // DependencyContainer
    private func createSplashDIContainer() -> SplashDIContainer {
        return SplashDIContainer(rootDIContainer: self)
    }

    private func createHomeDIContainer(token: Token) -> HomeDIContainer {
        return HomeDIContainer(token: token)
    }

    private func createLoginDIContainer() -> LoginDIContainer {
        return LoginDIContainer(rootDIContainer: self)
    }

}
