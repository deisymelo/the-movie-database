//
//  MovieCollectionViewCell.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet var content: UIView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyles()
    }

    
    func setStyles(){
        content.cornerStyle()
        lblTitle.labelBold()
    }
}
