//
//  BaseViewController.swift
//  BaseModule
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
open class BaseViewController: UIViewController {
    
    
public func setubObservers(viewModel:BaseViewModel){
        viewModel.observState?.subscribe({ state in
        switch state {
            
        case .loading:
            self.showActivityIndicator()
        case .error:
            print("error")
            self.hideActivityIndicator()
        case .empty:
            self.hideActivityIndicator()
        case .populated:
            self.hideActivityIndicator()
        case .none:
            self.hideActivityIndicator()
        case .reloading:
            self.hideActivityIndicator()
            self.reloadTableView()
        }
    })
}
    open func reloadTableView(){}
}
