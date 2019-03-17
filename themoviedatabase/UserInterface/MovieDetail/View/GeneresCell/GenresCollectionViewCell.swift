//
//  GenresCollectionViewCell.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {

    @IBOutlet var content: UIView!
    
    @IBOutlet var lblGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyles()
    }

    
    func setStyles(){
        content.backgroundGenres()
        lblGenre.labelRegularWhite()
    }
}
