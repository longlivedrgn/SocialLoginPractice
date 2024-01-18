//
//  RootViewController.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxAppState

final class RootViewController: UIViewController {

    private let viewModel: RootViewModel
    private let splashViewControllerFactory: () -> SplashViewController
    private let loginViewControllerFactory: () -> LoginViewController
    private let homeViewControllerFactory: (Token) -> HomeViewController

    private let disposeBag = DisposeBag()

    init(
        viewModel: RootViewModel,
        splashViewControllerFactory: @escaping () -> SplashViewController,
        loginViewControllerFactory: @escaping () -> LoginViewController,
        homeViewControllerFactory: @escaping (Token) -> HomeViewController
    ) {
        self.viewModel = viewModel
        self.splashViewControllerFactory = splashViewControllerFactory
        self.loginViewControllerFactory = loginViewControllerFactory
        self.homeViewControllerFactory = homeViewControllerFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        self.bind()
    }

    private func bind() {

        rx.viewDidAppear
            .take(1)
            .flatMapFirst { _ in self.viewModel.navigation }
            .subscribe(onNext: { [weak self] action in
                guard let self = self else { return }
                self.navigate(action)
            })
            .disposed(by: disposeBag)

    }

    private func navigate(_ navigation: Navigation) {
        let viewController = createViewController(navigation.destination)
        self.navigate(viewController, action: navigation.action)
    }

    private func createViewController(_ next: Destination) -> UIViewController {

        switch next as! RootDestination {
        case .splash: return splashViewControllerFactory()
        case .signedOut: return loginViewControllerFactory()
        case .signedIn(let token): return homeViewControllerFactory(token)
        }

    }

}
