//
//  Date.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import Foundation

extension Date{
    func toString(format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.init(identifier: "es_CO")
        return dateFormatter.string(from: self)
    }
}
