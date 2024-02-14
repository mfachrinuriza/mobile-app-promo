//
//  HomeService.swift
//  mobile-app-promo
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import Foundation
import Alamofire
import RxSwift
import core

protocol HomeServiceProtocol {
    func getPromos() -> Observable<BaseResponse<[Promo]>>
}

class HomeService: BaseService {
    static let sharedInstance = HomeService()
}

extension HomeService: HomeServiceProtocol {
    func getPromos() -> RxSwift.Observable<BaseResponse<[Promo]>> {
        return Observable.create { observer in
            let url = self.HOST_URL + API.promos
            
            AF.request(
                url,
                method: .get,
                headers: self.getHeaders()
            ).responseDecodable(of: BaseResponse<[Promo]>.self) { response in
                self.showResponseData(data: response.data)
                switch response.result {
                case .success(let result):
                    observer.onNext(result)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
