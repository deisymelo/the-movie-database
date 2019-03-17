//
//  CastCollectionViewCell.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {

    @IBOutlet var content: UIView!
    @IBOutlet var photo: UIImageView!
    @IBOutlet var lblCharacter: UILabel!
    @IBOutlet var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyles()
    }
        
    func setStyles(){
        content.cardStyle()
        lblCharacter.labelBold()
        lblName.labelRegular()
        photo.setCorner()
    }

}
