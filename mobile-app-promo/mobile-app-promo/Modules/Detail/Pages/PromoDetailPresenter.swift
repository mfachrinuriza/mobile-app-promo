//
//  PromoDetailPresenter.swift
//  mobile-app-promo
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import Foundation
import Combine
import core

protocol PromoDetailPresenterProtocol: AnyObject {
    var interactor: PromoDetailInteractorProtocol { get }
    var router: PromoDetailRouterProtocol? { get set }
    var view: PromoDetailViewControllerProtocol? { get set }

}

class PromoDetailPresenter: PromoDetailPresenterProtocol {
    internal let interactor: PromoDetailInteractorProtocol
    
    weak var router: PromoDetailRouterProtocol?
    weak var view: PromoDetailViewControllerProtocol?
    
    init(
        interactor: PromoDetailInteractorProtocol
    ) {
        self.interactor = interactor
    }
    
}
