//
//  Movie.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/15/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import ObjectMapper


class Movie: Mappable {
    
    var voteCount:Int?
    var id:Int?
    var video:Bool?
    var voteAverage:Double?
    var title:String?
    var popularity:Double?
    var posterPath:String?
    var originalLanguage:String?
    var originalTitle:String?
    var backdropPath:String?
    var adult:Bool?
    var overview:String?
    var releaseDate:String?
    var homepage:String?
    var productionCompanies:[ProductionCompany]?
    var genres:[Genre]?
    
    required init?(map: Map) {}
    
    required init(){}
    
    func mapping(map: Map) {
        voteCount <- map["vote_count"]
        id <- map["id"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        title <- map["title"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        backdropPath <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        homepage <- map["homepage"]
        productionCompanies <- map["production_companies"]
        genres <- map["genres"]
    }
}
