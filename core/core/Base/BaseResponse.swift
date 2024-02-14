//
//  BaseResponse.swift
//  core
//
//  Created by Muhammad Fachri Nuriza on 15/02/24.
//

import Foundation

public struct BaseResponse<T: Codable> {
    public var promos: T?
}

extension BaseResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case promos
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            promos = try container.decode(T.self, forKey: .promos)
        } catch {
            Logger.printLog("=== DECODE ERROR ===")
            Logger.printLog(error)
        }
    }
}

struct Nil: Codable {}
