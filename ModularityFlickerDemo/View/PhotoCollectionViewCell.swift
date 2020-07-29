//
//  PhotoCollectionViewCell.swift
//  ModularityFlickerDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    static let cellID = "\(PhotoCollectionViewCell.self)"
    
    
    var photoCellViewModel:PhotosCellViewModel? {
        didSet {
            
            let url = URL(string: photoCellViewModel?.url ?? "")
            let resource = ImageResource(downloadURL: url!)
            photoImageView.kf.indicatorType = .activity
            photoImageView.kf.setImage(with: resource,placeholder: UIImage(named: "defalut.jpg"))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
