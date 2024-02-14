//
//  HomeViewController.swift
//  mobile-app-pembayaran-qris
//
//  Created by Muhammad Fachri Nuriza on 13/02/24.
//

import UIKit
import AVFoundation
import core

protocol HomeViewControllerProtocol where Self: UIViewController {
    var presenter: HomePresenterProtocol { get }
    var router: HomeRouterProtocol { get }
    
    func update(with promos: [Promo])
    var errorMessage: String? { get set }
}

class HomeViewController: BaseViewController, HomeViewControllerProtocol {
    public var homePresenterProtocol: HomePresenterProtocol!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyState: UILabel!
    
    internal let presenter: HomePresenterProtocol
    internal let router: HomeRouterProtocol

    var promos: [Promo]?
    var errorMessage: String? = nil {
        didSet {
            self.showAlert(title: Wording.error, message: errorMessage)
        }
    }
    
    init(
        presenter: HomePresenterProtocol,
        router: HomeRouterProtocol
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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        loadData()
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PromoCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PromoCell.cellIdentifier)
    }
    
    func loadData() {
        self.presenter.getPromos()
    }
    
    func update(with promos: [Promo]) {
        if promos.count > 0 {
            self.promos = promos
            self.collectionView.reloadData()
            self.collectionView.isHidden = false
            self.emptyState.isHidden = true
        } else {
            self.collectionView.isHidden = true
            self.emptyState.isHidden = false
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.promos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCell.cellIdentifier, for: indexPath) as! PromoCell
        let data = self.promos![indexPath.row]
        cell.update(with: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = promos![indexPath.row]
        self.router.presentPromoDetail(promo: data)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: 190
        )
    }
}


