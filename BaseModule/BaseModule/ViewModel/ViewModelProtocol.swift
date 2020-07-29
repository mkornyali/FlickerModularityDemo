//
//  ViewModelProtocol.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
public protocol ViewModelProtocol : class {
    
   // associatedtype cellViewModel
    var observState : Observable<State?>? { get set }
    var apiProtocol : FlickerRepoProtocol? { set get}
    

    
}
