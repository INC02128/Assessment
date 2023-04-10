//
//  ApiModel.swift
//  API calling and collectionView
//
//  Created by INCTURE on 10/04/23.
//

import Foundation
struct PostModel: Codable {
    var userID, id: Int?
    var title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
