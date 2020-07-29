//
//  Photos.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
struct Result: Codable {
    let photos: Photos?
    
}

struct Photos: Codable {
    let page, pages, perpage: Int?
    let total: String
    let photo: [Photo]
}

struct Photo: Codable, PhotoURL {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}

protocol PhotoURL {}

extension PhotoURL where Self == Photo{
    func getImagePath() -> String?{
        let path = "http://farm\(self.farm).static.flickr.com/\(self.server)/\(self.id)_\(self.secret).jpg"
        return path
    }
}
