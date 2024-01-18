//
//  AppDelegate.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/17/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let kakaoApiKey = Bundle.main.infoDictionary?["KakaoAppKey"] as! String
    private let rootDIContainer = RootDIContainer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootViewController = rootDIContainer.createRootViewController()
        let window = UIWindow()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window

        KakaoSDK.initSDK(appKey: kakaoApiKey)
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            return AuthController.handleOpenUrl(url: url)
        }
        return false
    }
}

