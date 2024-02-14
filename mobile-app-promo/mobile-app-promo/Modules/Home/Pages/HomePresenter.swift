//
//  HomePresenter.swift
//  mobile-app-pembayaran-qris
//
//  Created by Muhammad Fachri Nuriza on 13/02/24.
//

import Foundation
import Combine
import RxSwift
import core

protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorProtocol { get }
    var router: HomeRouterProtocol? { get set }
    var view: HomeViewControllerProtocol? { get set }
    
    func getPromos() 
}

class HomePresenter: HomePresenterProtocol {
    internal let interactor: HomeInteractorProtocol
    
    weak var router: HomeRouterProtocol?
    weak var view: HomeViewControllerProtocol?

    let disposeBag = DisposeBag()
    
    init(
        interactor: HomeInteractorProtocol
    ) {
        self.interactor = interactor
    }
    
    func getPromos() {
        self.interactor.getPromos().subscribe(onNext: { result in
            self.view?.update(with: result.promos ?? [Promo]())
        }, onError: { error in
            self.view?.errorMessage = Wording.systemError
        }).disposed(by: disposeBag)
    }
}
