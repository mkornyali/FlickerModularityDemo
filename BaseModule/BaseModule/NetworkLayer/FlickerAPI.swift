//
//  FlickerAPI.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import Moya

enum FlickerAPI {
    case email(email:String)
    case photo(text:String)
    
}

extension FlickerAPI {
    var sampleData: Data {
        switch self {
            
        case .email:
            return stubbedResponse("email")
        case .photo:
            return stubbedResponse("photos")
            
        }
    }
    
    func stubbedResponse(_ file:String) -> Data!{
        @objc class TestClass : NSObject {}
        let b = Bundle(for: TestClass.self)
        let path = b.path(forResource: file, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
    
}



extension FlickerAPI :TargetType {
    
    
    var baseURL: URL {
        return URL(string:"https://www.flickr.com/")!
    }
    
    var path: String {
        switch self {
            
        
        case .email , .photo:
            return "services/rest"
      
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    
//    var parameters:[String:Any] {
//        switch self {
//            
//     
//        case .email(let email):
//            return ["method" : "flickr.people.findByEmail" , "api_key": Constants.API_Key , "find_email" : email ,"format" : "json" , "nojsoncallback":1]
//        case .photo(let text):
//            return ["method" : "flickr.photos.search" ,"api_key" : Constants.API_Key , "format":"json" , "safe_search" : 1 ,  "nojsoncallback":1 , "text":text ]
//        }
//    }
    /*
     work
    https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=a0ec4ce570ff652cdf19e3ffc5519912&text=Egypt&format=json&nojsoncallback=1

     dosn't work
    https://www.flickr.com//services/rest?api_key=a0ec4ce570ff652cdf19e3ffc5519912&format=json&method=photos.search&nojsoncallback=1&safe_search=1&text=egypt
    */
    
    
    var task: Task {
        switch self {
            
        
        case .email( let email):
            return .requestParameters(parameters: [ "method" : "flickr.people.findByEmail" , "api_key": Constants.API_Key , "find_email" : email ,"format" : "json" , "nojsoncallback":1] , encoding: URLEncoding.queryString)
        case .photo(text: let text):
            return .requestParameters(parameters: ["method" : "flickr.photos.search" ,"api_key" : Constants.API_Key , "format":"json" , "safe_search" : 1, "nojsoncallback":1 , "text":text ], encoding: URLEncoding.queryString)
        }
    }
    
    
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
    
    
}


class Constants {
    private init (){}
    static let API_Key = "a0ec4ce570ff652cdf19e3ffc5519912"
}





