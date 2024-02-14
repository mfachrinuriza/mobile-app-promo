//
//  PromoDetailInteractor.swift
//  mobile-app-promo
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import Foundation
import core

protocol PromoDetailInteractorProtocol: AnyObject {
}

class PromoDetailInteractor: PromoDetailInteractorProtocol {
    var homeService: HomeServiceProtocol

    init(
        homeService: HomeServiceProtocol
    ) {
        self.homeService = homeService
    }
}
