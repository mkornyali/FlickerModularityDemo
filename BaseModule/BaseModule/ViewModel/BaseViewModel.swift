//
//  BaseViewModel.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
open class BaseViewModel: ViewModelProtocol  {
    open var observState: Observable<State?>?
    open var apiProtocol: FlickerRepoProtocol?
    
    
    public init(){
        self.apiProtocol = FlickerRepo()
        self.observState = Observable<State?>(.empty)
    }
}
