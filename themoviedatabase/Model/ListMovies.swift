//
//  ListMovies.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/15/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import ObjectMapper


class ListMovies: Mappable {

    var page:Int?
    var totalResults:Int?
    var totalPages:Int?
    var results:[Movie]?
    
    required init?(map: Map) {}
    
    required init(){}
    
    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }
    
}
