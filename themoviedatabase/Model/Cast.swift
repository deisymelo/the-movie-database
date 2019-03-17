//
//  Cast.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import ObjectMapper


class Cast: Mappable {
    var id:Int?
    var character:String?
    var name:String?
    var profilePath:String?
    
    required init?(map: Map) {}
    init() {}
    
    func mapping(map: Map) {
        id <- map["cast_id"]
        character <- map["character"]
        name <- map["name"]
        profilePath <- map["profile_path"]
    }
}
