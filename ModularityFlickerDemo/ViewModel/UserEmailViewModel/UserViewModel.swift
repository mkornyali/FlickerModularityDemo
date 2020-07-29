//
//  photosNameViewModel.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import BaseModule
import SearchName
class UserViewModel : BaseViewModel {
    var coreViewModel = CoreViewModel()
    var username = Observable<String?> (nil)
    func fetchingDetailsByEmail(email:String)  {
        observState?.value = .loading
        coreViewModel.fetchingDetailsByEmail(email: email, decode: { (codable) -> Source? in
            guard let flickerResult = codable as? Source else { return  nil }
            return flickerResult
        }, completionHandler: { (source, error) in
            if error != nil {
                print(" error is : \(error?.localizedDescription ?? "NO error exist")")
            }
            else {
                print(source?.user?.username ?? "")
                print(source!)
                self.username.value = source?.user?.username?.content
               self.observState?.value = .reloading
            }
        })
    }
    

    
}
