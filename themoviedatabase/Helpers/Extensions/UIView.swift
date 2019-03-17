//
//  UIView.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func cornerStyle(){
        self.backgroundColor = .white
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(named: "gray")?.cgColor
    }
    
}
