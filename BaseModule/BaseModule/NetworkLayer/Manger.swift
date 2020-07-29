//
//  Manger.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import Moya

protocol Networkable {
    func fetchData <T:Codable> (target:FlickerAPI , complitionHandler:@escaping (T? , Swift.Error?) -> ())
   
}


class NewtorkManger:Networkable {
 
    fileprivate let provider = MoyaProvider<FlickerAPI>()
    func fetchData <T:Codable> (target:FlickerAPI , complitionHandler: @escaping (_ result : T? , _ error : Swift.Error?) -> ()) {
        provider.request(target) { (result) in
                    switch  result {
                    case .success(let response) :
                    do {
                        print("response data is ... \(response.data)")
                        let resultApi = try JSONDecoder().decode(T.self, from: response.data)
                        complitionHandler(resultApi,nil)
                        
                    }catch(let ex) {
                        print(#function, "exception with: \(ex)")
                        complitionHandler(nil,ex)
                    }
                    
                case .failure(let error) :
                    print(#function, "error with: \(error)")
                    complitionHandler(nil,error)
                }
        }
    }
}
