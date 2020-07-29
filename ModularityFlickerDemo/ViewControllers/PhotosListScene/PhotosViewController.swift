//
//  PhotosViewController.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import BaseModule
class PhotosViewController: BaseViewController {
    @IBOutlet weak var photosColloectionView: UICollectionView!
    
    @IBOutlet weak var searchTextField: UITextField!
    let photosListViewModel = PhotosListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        addActionDidTextChangedToSearchText()
        setupCollectionView()
        setubObservers(viewModel: photosListViewModel)
       // photosListViewModel.fetchingPhotos(text: "pyramids")
    }
    
    func setupCollectionView() {
          photosColloectionView.delegate = self
          photosColloectionView.dataSource = self
          let cell = UINib(nibName: "\(PhotoCollectionViewCell.cellID)", bundle: nil)
          photosColloectionView.register(cell, forCellWithReuseIdentifier: "\(PhotoCollectionViewCell.cellID)")
      }
    
    override func reloadTableView() {
           photosColloectionView.reloadData()
       }
    
    func addActionDidTextChangedToSearchText() {
        searchTextField.addTarget(self, action: #selector(PhotosViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            var searchTimer: Timer?
            if textField.text != "" {
                searchTimer?.invalidate()
                searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [unowned self] (timer) in
                    //do Something crazy
    
                    if textField.text != "" {
                        self.photosListViewModel.fetchingPhotos(text: textField.text ?? "")
                    }
                    else {
                        return
                    }
                    
                })
            }
}
}
