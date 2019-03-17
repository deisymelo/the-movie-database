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
import CoreData


class DetailViewModel {

    public let castList: PublishSubject<[Cast]> = PublishSubject()
    public let error: PublishSubject<String> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let genreString: PublishSubject<[String]> =  PublishSubject()
    
    public let genresList: PublishSubject<[Genre]> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    /**
        Consulta la lista de artistas que participaron en la película consultada
     **/
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
    
    
    /**
     De la lista de géneros, consulta el nombre de cada uno y los retrona en un array de String
     **/
    public func getGender(genreIds ids:[Int], list:[Genre]){
        //getGenresList()
        var genreNames = [String]()
        
        for id:Int in ids {
            let genre = list.filter({ (genre) -> Bool in
                return genre.id ==  id
            }).first
            
            genreNames.append(genre?.name ?? "")
        }
        
        self.genreString.onNext(genreNames)
    }
    

    
    
    /**
        Consulta en la base de datos del dispositivo la lista de géneros
        de películas. Si no hay datos registrados, hace la consulta al api.
     **/
    public func getGenresList(){
        // llama el objeto AppDelegate para poder utilizar las funciones que allí se encuentran
        let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        //se obtiene el contexto: Es la interfaz para acceder a la base de datos...
        let context = appDelegate.managedObjectContext
        //Se realiza la consulta de las ciudades
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Genres")
        
        var genresList = [Genre]()
        
        do{
            let result = try? context.fetch(request)
            
            if result!.count > 0  {
                for data in result as! [NSManagedObject] {
                    let genre:Genre = Genre.init()
                    genre.id = data.value(forKey: "id") as? Int
                    genre.name = data.value(forKey: "name") as? String
                    genresList.append(genre)
                }
                
                self.genresList.onNext(genresList)
            }
            else{
                self.getGenresAPI()
            }
        }
    }
    
    
    
    /**
     Consulta en el API los géneros de las películas
     **/
    private func getGenresAPI(){
        self.loading.onNext(true)

        let url = "\(pathEndPoints)/genre/movie/list?api_key=\(apiKey)"

        request(url, encoding:JSONEncoding.default).responseJSON {
            response in

            self.loading.onNext(false)
            switch(response.result){
            case .success(_):
                let json = JSON(response.result.value!)
                
                guard let data = Mapper<Genre>().mapArray(JSONObject: json["genres"].arrayObject) else {
                    return self.castList.onNext([])
                }

                self.genresList.onNext(data)
                self.saveGenresDataBase(genresLis: data)

            case .failure(let error):
                self.error.onNext(error.localizedDescription.debugDescription)
            }
        }
    }
    
    /**
     Guarda la lista de géneros obtenidoss en la base de datos del dispositivo
     **/
    private func saveGenresDataBase(genresLis list:[Genre]){
        
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.managedObjectContext
        
        do{
            //Borra los datos para que no se dupliquen
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Genres")
            let request = NSBatchDeleteRequest(fetchRequest: fetch)
            try context.execute(request)
            
            for genre:Genre in list {
                //se crea un nuevo registro
                let newGenre: AnyObject = NSEntityDescription.insertNewObject(forEntityName: "Genres", into: context)
                //Se insertan los datos
                newGenre.setValue(genre.id, forKey: "id")
                newGenre.setValue(genre.name, forKey: "name")
                //Guarda el nuevo registro
                try context.save()
            }
        }
        catch{
            print("Error al guardare en BD")
        }
    }
    
}
