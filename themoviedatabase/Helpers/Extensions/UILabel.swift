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
    
    func subtitle(){
        self.textColor = .black
        self.font = UIFont(name: FONT_TYPE_BOLD, size: 18)
    }
    
    
    func subtitlePrimary(){
        self.textColor = UIColor.init(named: "green")
        self.font = UIFont(name: FONT_TYPE_BOLD, size: 18)
    }
    
    
    func subtitleWhite(){
        self.textColor = .white
        self.font = UIFont(name: FONT_TYPE_BOLD, size: 18)
    }
    
    func labelRegular(){
        self.textColor = .black
        self.font = UIFont(name: FONT_TYPE_REGULAR, size: 14)
    }
    
    func labelBold(){
        self.textColor = .black
        self.font = UIFont(name: FONT_TYPE_BOLD, size: 14)
    }
    
    func labelRegularWhite(){
        self.textColor = .white
        self.font = UIFont(name: FONT_TYPE_REGULAR, size: 14)
    }
    
    
    func labelBoldWhite(){
        self.textColor = .white
        self.font = UIFont(name: FONT_TYPE_BOLD, size: 14)
    }
}
