//
//  UIViewController+.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit


// MARK: 아래는 수정할 예정
extension UIViewController {

}

extension UIViewController {

    func navigate(_ viewController: UIViewController, action: NavigationAction) {
        switch action {
        case .present(let animated):
            if let presentedViewController = self.presentedViewController {
                presentedViewController.dismiss(animated: false, completion: { [weak self] in
                    viewController.modalPresentationStyle = .fullScreen
                    self?.present(viewController, animated: animated, completion: nil)
                })
            } else {
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: animated, completion: nil)
            }

        case .push:
            if let presentedViewController = self.presentedViewController {
                presentedViewController.dismiss(animated: false, completion: { [weak self] in
                    self?.navigationController?.pushViewController(viewController, animated: true)
                })
            } else {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
