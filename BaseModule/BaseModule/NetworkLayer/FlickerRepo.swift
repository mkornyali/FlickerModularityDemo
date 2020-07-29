//
//  FlickerRepo.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

public class FlickerRepo : FlickerRepoProtocol {
    public func getPhotosByText<T>(text: String, decode: @escaping (Codable) -> T?, completionHandler: @escaping (T?, Error?) -> ()) where T : Decodable, T : Encodable {
        network.fetchData(target: .photo(text: text), complitionHandler: completionHandler)
    }
    
    
//    let network:Networkable = NewtorkManger()
//    public func requestFor<T>(searchType: SearchType, decode: @escaping (Codable) -> T?, completionHandler: @escaping (T?, Error?) -> ()) where T : Decodable, T : Encodable {
//
//        switch searchType {
//
//        case .email(let email):
//            network.fetchData(target: .email(email: email), complitionHandler: completionHandler)
//        case .photo(let text):
//            network.fetchData(target: .photo(text: text), complitionHandler: completionHandler)
//        }
//    }
//
    let network:Networkable = NewtorkManger()
       public func getUserDetailsByEmail<T>(email: String, decode: @escaping (Codable) -> T?, completionHandler: @escaping (T?, Error?) -> ()) where T : Decodable, T : Encodable {
           network.fetchData(target: .email(email: email), complitionHandler: completionHandler)
           
       }
    
 
    
}
