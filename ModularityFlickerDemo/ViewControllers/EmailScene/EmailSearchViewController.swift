//
//  ViewController.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/28/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
//import SearchName
import BaseModule

class EmailSearchViewController: BaseViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var searchIcon: UIImageView!
    
    
    var flickerViewModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSearchIconClick()
        setupSearchView()
        setubObservers(viewModel: flickerViewModel)
        
        setupUserNameListner()
    }
    override func reloadTableView() {
           print("Reload table View")
           
       }
    
    func setupUserNameListner(){
       flickerViewModel.username.subscribe {[unowned self] (username) in
        self.userNameLbl.text = username
       }
        
    }
    
    func setupSearchView() {
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setupSearchIconClick(){
          let searchIconTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchIconDidPressed(tapGestureRecognizer:)))
          searchIcon.isUserInteractionEnabled = true
          searchIcon.addGestureRecognizer(searchIconTapGestureRecognizer)
      }
    
    @objc func searchIconDidPressed(tapGestureRecognizer: UITapGestureRecognizer){
        if let text = searchTextField.text
        {
            
            flickerViewModel.fetchingDetailsByEmail(email: text)
        }
    }
}



