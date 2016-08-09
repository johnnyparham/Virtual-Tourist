//
//  PhotoCollectionViewCell.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/9/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var photoView: UIImageView!
    
    // Outlet for label
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func prepareForReuse() {
        if photoView.image == nil {
            activityIndicator.stopAnimating()
        }
    }

}
