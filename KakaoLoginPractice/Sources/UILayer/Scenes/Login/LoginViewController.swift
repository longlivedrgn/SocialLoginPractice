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
        self.bind()
        self.configureViews()
    }

    private func bind() {
        Observable<Provider>.merge(
            self.signInKakaoButton.rx.tap.map { .kakao },
            self.signInAppleButton.rx.tap.map { .apple }
        )
        .subscribe(onNext: { [weak self] provider in
            print("it's tapped!..")
            self?.viewModel?.signIn(with: provider)
        })
        .disposed(by: disposeBag)
    }

    private func configureViews() {
        self.view.backgroundColor = .red

        self.view.addSubview(signInKakaoButton)
        self.view.addSubview(signInAppleButton)

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
