//
//  HomeDIContainer.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit

final class HomeDIContainer {

    let token: Token

    init(token: Token) {
        self.token = token
    }

    func createHomeViewController() -> HomeViewController {
        return HomeViewController(viewModel: createHomeViewModel())
    }

    private func createHomeViewModel() -> HomeViewModel {
        return HomeViewModel()
    }

    // 여기서 HomeView의 하위 뷰들을 RootDIContainer와 비슷한 느낌으로 쭉 이어간다!..

}
