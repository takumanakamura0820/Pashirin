//
//  Post.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

// MARK: - Order
struct Order: Codable {
    let id, userID: Int
    let chargeBy: String?
    let status, content: String?
    let coin: Int?
    let createdAt, updatedAt: String?
    let title, time, categoryID: String?
    let userName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case chargeBy = "charge_by"
        case status, content, coin
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case title, time
        case categoryID = "category_id"
        case userName = "user_name"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
