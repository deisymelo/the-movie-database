//
//  UILabel.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import Foundation
import UIKit


extension UILabel {
    
    func labelRegular(){
        self.textColor = .black
        self.font = UIFont(name: FONT_TYPE_REGULAR, size: 16)
    }
    
    func labelBold(){
        self.textColor = .black
        self.font = UIFont(name: FONT_TYPE_BOLD, size: 16)
    }
}
