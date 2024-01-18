//
//  SplashViewController.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit

final class SplashViewController: UIViewController {

    var viewModel: SplashViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let splashDuration: DispatchTimeInterval = .seconds(2)

        DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration) { [weak self] in
            self?.viewModel?.loadAccessToken()
        }

    }
}
