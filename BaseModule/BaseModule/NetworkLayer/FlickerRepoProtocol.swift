//
//  FlickerRepoProtocol.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
//typealias flickerDetailsUserByEmail = (_ responseModel : Source? , _ errorMessage:  Swift.Error?) -> ()

public protocol FlickerRepoProtocol {
//    func requestFor<T: Codable>(email: SearchType, decode: @escaping (Codable) -> T?, completionHandler: @escaping (_ result : T? , _ error : Swift.Error?) -> ())
    
    func getUserDetailsByEmail<T: Codable>(email: String, decode: @escaping (Codable) -> T?, completionHandler: @escaping (_ result : T? , _ error : Swift.Error?) -> ())
    
     func getPhotosByText<T: Codable>(text: String, decode: @escaping (Codable) -> T?, completionHandler: @escaping (_ result : T? , _ error : Swift.Error?) -> ())
}


