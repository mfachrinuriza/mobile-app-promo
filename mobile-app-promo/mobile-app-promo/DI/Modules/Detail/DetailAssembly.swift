//
//  DetailAssembly.swift
//  mobile-app-promo
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import Swinject
import SwinjectAutoregistration

class DetailAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(PromoDetailInteractorProtocol.self, initializer: PromoDetailInteractor.init)
        container.autoregister(PromoDetailRouterProtocol.self, initializer: PromoDetailRouter.init)
        container.autoregister(PromoDetailPresenterProtocol.self, initializer: PromoDetailPresenter.init)

        container.register(PromoDetailViewControllerProtocol.self) { r in
            let presenter = r.resolve(PromoDetailPresenterProtocol.self)!
            let router = r.resolve(PromoDetailRouterProtocol.self)!
            let view = PromoDetailViewController(
                presenter: presenter,
                router: router
            )
            
            presenter.view = view
            presenter.router = router
            router.view = view
            
            return view
        }
    }
    
}
