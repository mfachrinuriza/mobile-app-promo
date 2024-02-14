//
//  PromoCell.swift
//  mobile-app-promo
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import UIKit
import core
import Kingfisher

class PromoCell: UICollectionViewCell {

    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    static let cellIdentifier = "PromoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with promo: Promo) {
        self.promoImage.kf.setImage(with: URL(string: promo.images_url ?? ""), placeholder: UIImage(named: "ic_default_image_1", in: Bundle(identifier: CoreBundle.getIdentifier()), compatibleWith: nil))
        self.title.text = promo.name
        self.detail.text = promo.detail
    }
}
