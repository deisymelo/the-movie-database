//
//  String.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import Foundation

extension String {
    
    func getYear() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let year = dateFormatter.date(from: self)?.toString(format: "yyyy") else {
            return self
        }
        
        return year
       
    }
    
}
