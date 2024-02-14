//
//  HomeInteractor.swift
//  mobile-app-pembayaran-qris
//
//  Created by Muhammad Fachri Nuriza on 13/02/24.
//

import Foundation
import RxSwift
import core

protocol HomeInteractorProtocol: AnyObject {
    func getPromos() -> Observable<BaseResponse<[Promo]>>
}

class HomeInteractor: HomeInteractorProtocol {
    var homeService: HomeServiceProtocol

    var promos: [Promo]? = nil {
        didSet {
            
        }
    }
    
    init(
        homeService: HomeServiceProtocol
    ) {
        self.homeService = homeService
    }
    
    func getPromos() -> Observable<BaseResponse<[Promo]>> {
        return homeService.getPromos()
    }
}
