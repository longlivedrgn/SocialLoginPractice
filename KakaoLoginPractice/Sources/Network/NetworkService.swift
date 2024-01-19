//
//  NetworkService.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation
import RxSwift
import RxMoya
import Moya
import UIKit

protocol NetworkServing {
    func request<Router: ServiceRouter>(_ router: Router) -> Observable<Router.Response>
}

final class NetworkService: NetworkServing {

    private let provider = MoyaProvider<MultiTarget>(session: Session(interceptor: AuthenticationInterceptor()))
    private let disposeBag = DisposeBag()

    func request<Router: ServiceRouter>(_ router: Router) -> Observable<Router.Response> {
        let endPoint = MultiTarget.target(router)
        return self.provider.rx.request(endPoint)
            .asObservable()
            .map(ServerResponseDTO<Router.Response>.self)
            .compactMap { return $0.data }
    }
}
