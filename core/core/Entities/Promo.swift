//
//  Transaction.swift
//  mobile-app-pembayaran-qris
//
//  Created by Muhammad Fachri Nuriza on 13/02/24.
//

import Foundation


public struct Promo: Codable {
    public var id: Int?
    public var name: String?
    public var images_url: String?
    public var detail: String?
    
    public init(
        id: Int? = nil,
        name: String? = nil,
        images_url: String? = nil,
        detail: String? = nil
    ) {
        self.id = id
        self.name = name
        self.images_url = images_url
        self.detail = detail
    }
}
