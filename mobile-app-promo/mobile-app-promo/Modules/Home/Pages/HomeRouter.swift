//
//  HomeRouter.swift
//  mobile-app-pembayaran-qris
//
//  Created by Muhammad Fachri Nuriza on 13/02/24.
//

import Foundation
import core

protocol HomeRouterProtocol: AnyObject {
    var view: HomeViewControllerProtocol? { get set }
    
    func presentPromoDetail(promo: Promo)
}

class HomeRouter: HomeRouterProtocol {
    weak var view: HomeViewControllerProtocol?
    
    func presentPromoDetail(promo: Promo) {
        let vc = DI.get(PromoDetailViewControllerProtocol.self)!
        vc.promo = promo
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
