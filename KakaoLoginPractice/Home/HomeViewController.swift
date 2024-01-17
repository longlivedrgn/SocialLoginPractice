//
//  HomeViewController.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {

    private let viewModel: HomeViewModel
    private let disposeBag = DisposeBag()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
