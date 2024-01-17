//
//  LoginViewController.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {

    var viewModel: LoginViewModel?

    private let disposeBag = DisposeBag()

    private let signInKakaoButton: UIButton = {
        let button = UIButton()
        return button
    }()

    private let signInAppleButton: UIButton = {
        let button = UIButton()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    private func bind() {
        Observable<Provider>.merge(
            self.signInKakaoButton.rx.tap.map { .kakao },
            self.signInAppleButton.rx.tap.map { .apple }
        )
        .subscribe(onNext: { [weak self] provider in
            self?.viewModel?.signIn(with: provider)
        })
        .disposed(by: disposeBag)
    }

}
