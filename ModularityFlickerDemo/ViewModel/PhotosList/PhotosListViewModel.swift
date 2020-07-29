//
//  PhotosListViewModel.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import BaseModule
import PhotosModule

class PhotosListViewModel : BaseViewModel {
    
    let coreViewModel = CorePhotosViewModel()
    var photos = Observable<[Photo]?> (nil)
    var numberOfCells : Int {
        return cellViewModel.count
    }
    private var cellViewModel = [PhotosCellViewModel]() {
        didSet{
            observState?.value = .reloading
        }
    }
    func fetchingPhotos(text:String) {
        observState?.value = .loading
        coreViewModel.fetchingPhotosByText(text: text, decode: { (codable) -> Result? in
            guard let flickerResult = codable as? Result else { return  nil }
            return flickerResult
        }, completionHandler: { [unowned self](photosResult, error) in
            if error != nil {
                print(" error is : \(error?.localizedDescription ?? "NO error exist")")
            }
            else {
                print("Success.......")
                let photosArray = photosResult?.photos?.photo
                print(photosArray?.count ?? 1)
                self.photos.value = photosArray
                self.createCellsViewModels(items: photosArray!)
                self.observState?.value = .populated
                
            }
        })
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PhotosCellViewModel? {
        return cellViewModel[indexPath.row]
    }
    
    
   private func createCellsViewModels(items photos:[Photo]){
    cellViewModel.removeAll()
        for photo in photos {
            self.cellViewModel.append(PhotosCellViewModel(photo: photo))
        }
    }
}
