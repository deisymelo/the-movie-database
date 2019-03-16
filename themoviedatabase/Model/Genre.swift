//
//  Genre.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/15/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import ObjectMapper


class Genre: Mappable {
    
    var id:Int?
    var name:String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
