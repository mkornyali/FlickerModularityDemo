//
//  State.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
public enum State {
    case loading
    case error(error:String?)
    case empty
    case populated
    case reloading
        
}
