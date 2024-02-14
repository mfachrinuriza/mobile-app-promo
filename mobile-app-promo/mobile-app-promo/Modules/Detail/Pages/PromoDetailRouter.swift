//
//  PromoDetailRouter.swift
//  mobile-app-promo
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import Foundation

protocol PromoDetailRouterProtocol: AnyObject {
    var view: PromoDetailViewControllerProtocol? { get set }
    
}

class PromoDetailRouter: PromoDetailRouterProtocol {
    weak var view: PromoDetailViewControllerProtocol?
    
}
