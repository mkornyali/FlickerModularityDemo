//
//  PhotosCellViewModel.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
class PhotosCellViewModel {
    let url:String
    init(photo:Photo) {
        url = photo.getImagePath() ?? ""
    }
}
