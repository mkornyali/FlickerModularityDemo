//
//  User.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
// MARK: - Source
struct Source: Codable {
    var user: User?
    var stat: String?
}

// MARK: - User
struct User: Codable {
    var id, nsid: String?
    var username: Username?
}

// MARK: - Username
struct Username: Codable {
    var content: String?

    enum CodingKeys: String, CodingKey {
        case content = "_content"
    }
}
