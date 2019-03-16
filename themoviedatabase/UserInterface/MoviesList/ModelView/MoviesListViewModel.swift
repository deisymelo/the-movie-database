//
//  MoviesListViewModel.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper


class MoviesListViewModel {
   
    public var result: PublishSubject<ListMovies> =  PublishSubject()
    public let moviesList: PublishSubject<[Movie]> = PublishSubject()
    public let error: PublishSubject<String> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    
     private let disposable = DisposeBag()
    
    public func getMoviesList(){
        self.loading.onNext(true)
        
        let url = "\(pathEndPoints)/discover/movie?api_key=\(apiKey)"
        
        request(url, encoding:JSONEncoding.default).responseJSON {
           response in
            
            self.loading.onNext(false)
            switch(response.result){
            case .success(_):
                 let json = JSON(response.result.value!)
                //let result = Mapper<ListMovies>().map(JSONObject: json.dictionaryObject)!
                
                guard let data = Mapper<ListMovies>().map(JSONObject: json.dictionaryObject) else {
                    return self.moviesList.onNext([])
                }
    
                //self.result.onNext(data)
                 self.moviesList.onNext(data.results ?? [])
            
            case .failure(let error):
               self.error.onNext(error.localizedDescription.debugDescription)
            }
        }
    }
}
