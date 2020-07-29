//
//  CoreViewModel.swift
//  SearchName
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import BaseModule
public class CoreViewModel : BaseViewModel {

 
    
    public func fetchingDetailsByEmail<T:Codable>(email: String, decode: @escaping (Codable) -> T?, completionHandler: @escaping (T?, Error?) -> ()) where T : Decodable, T : Encodable {
        observState?.value = .loading
        apiProtocol?.getUserDetailsByEmail(email: email, decode: decode, completionHandler: completionHandler)

    }
    

}
