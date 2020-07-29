//
//  CorePhotos.swift
//  PhotosModule
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import BaseModule
public class CorePhotosViewModel : BaseViewModel {
    public func fetchingPhotosByText<T:Codable>(text: String, decode: @escaping (Codable) -> T?, completionHandler: @escaping (T?, Error?) -> ()) where T : Decodable, T : Encodable {
        observState?.value = .loading
        apiProtocol?.getPhotosByText(text: text, decode: decode, completionHandler: completionHandler)
    }
}
