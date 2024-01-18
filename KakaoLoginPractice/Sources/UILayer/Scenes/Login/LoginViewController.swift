//
//  LoginViewController.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Moya
import RxMoya

final class LoginViewController: UIViewController {

    var viewModel: LoginViewModel?

    private let disposeBag = DisposeBag()

    private let signInKakaoButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오 로그인", for: .normal)
        return button
    }()

    private let signInAppleButton: UIButton = {
        let button = UIButton()
        button.setTitle("애플 로그인", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.bind()
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

    private func configureViews() {
        self.view.backgroundColor = .red

        self.view.addSubview(self.signInKakaoButton)
        self.view.addSubview(self.signInAppleButton)

        self.signInKakaoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        self.signInAppleButton.snp.makeConstraints { make in
            make.top.equalTo(self.signInKakaoButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
