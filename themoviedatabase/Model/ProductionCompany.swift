//
//  ProductionCompanie.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/15/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import ObjectMapper


class ProductionCompany: Mappable {
    
    var id:Int?
    var logoPath:String?
    var name:String?
    var originCountry:String?
    
    required init?(map: Map) {}
    
    init() {}
    
    func mapping(map: Map) {
        id <- map["id"]
        logoPath <- map["logo_path"]
        name <- map["name"]
        originCountry <- map["origin_country"]
    }
}
