//
//  Binding.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

public class Observable<T> {
    
   public typealias Observer = (T) -> ()
    var observer: Observer?
    
    open var value: T {
        didSet {
            observer?(value)
        }
    }
    
   public init(_ v: T) {
        value = v
    }
    
    func bind(_ listner: Observer?) {
        self.observer = listner
    }
    
    public func subscribe(_ observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
}
