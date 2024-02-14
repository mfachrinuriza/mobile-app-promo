//
//  PromoDetailViewController.swift
//  mobile-app-promo
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import UIKit
import core

protocol PromoDetailViewControllerProtocol where Self: UIViewController {
    var presenter: PromoDetailPresenterProtocol { get }
    var router: PromoDetailRouterProtocol { get }
    
    var promo: Promo? { get set }
}

class PromoDetailViewController: BaseViewController, PromoDetailViewControllerProtocol {

    internal let presenter: PromoDetailPresenterProtocol
    internal let router: PromoDetailRouterProtocol

    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var promoTitle: UILabel!
    @IBOutlet weak var promoDetail: UILabel!
    
    var promo: Promo?

    init(
        presenter: PromoDetailPresenterProtocol,
        router: PromoDetailRouterProtocol
    ) {
        self.presenter = presenter
        self.router = router
        

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.setNavigationBarWithTitle(title: "Promo Detail")
    }
    
    func setupUI() {
        self.promoImage.kf.setImage(with: URL(string: promo?.images_url ?? ""), placeholder: UIImage(named: "ic_default_image_1", in: Bundle(identifier: CoreBundle.getIdentifier()), compatibleWith: nil))
        promoTitle.text = promo?.name
        promoDetail.text = promo?.detail
    }
}
