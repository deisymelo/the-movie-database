//
//  DetailViewModel.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper


class DetailViewModel {

    public let castList: PublishSubject<[Cast]> = PublishSubject()
    public let error: PublishSubject<String> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    public func getCastList(movieId id:Int){
        self.loading.onNext(true)
        
        let url = "\(pathEndPoints)/movie/\(id)/credits?api_key=\(apiKey)"
        
        request(url, encoding:JSONEncoding.default).responseJSON {
            response in
            
            self.loading.onNext(false)
            switch(response.result){
            case .success(_):
                let json = JSON(response.result.value!)
                guard let data = Mapper<Cast>().mapArray(JSONObject: json["cast"].arrayObject) else {
                    return self.castList.onNext([])
                }
                
                self.castList.onNext(data)
                
            case .failure(let error):
                self.error.onNext(error.localizedDescription.debugDescription)
            }
        }
    }
}
