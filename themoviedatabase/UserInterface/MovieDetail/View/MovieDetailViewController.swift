//
//  MovieDetailViewController.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher


class MovieDetailViewController: UIViewController {
    
    @IBOutlet var imgBackdrop: UIImageView!
    @IBOutlet var imgPoster: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblOverview: UILabel!
    @IBOutlet var titleOverview: UILabel!
    @IBOutlet var lblUserScrore: UILabel!
    @IBOutlet var titleUserscore: UILabel!
    @IBOutlet var titleCast: UILabel!
    @IBOutlet var castCollectionView: UICollectionView!
    @IBOutlet var loaderCast: UIActivityIndicatorView!
 
    @IBOutlet var heightView: NSLayoutConstraint!
    
    var movie:Movie?
    
    let disposeBag = DisposeBag()
    var viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationItem.title = self.movie?.title ?? "Movie Detail"
        setStyles()
        showInitialData()
        setupBinding()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        self.heightView.constant += (self.lblOverview.frame.height)
    }
    
    
    private func showInitialData(){
        guard let movie = self.movie else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        viewModel.getCastList(movieId: movie.id ?? 0)
        viewModel.getGender(genreIds: movie.genreIds ?? [])
        
        
        let urlPoster = "\(pathImages)\(movie.posterPath!)"
        let urlBackdrop = "\(pathImages)\(movie.backdropPath!)"
        
        self.imgPoster.kf.setImage(with: URL(string: urlPoster))
        self.imgBackdrop.kf.setImage(with: URL(string: urlBackdrop))
        
        self.lblTitle.text =  movie.title
        self.lblDate.text = movie.releaseDate
        self.lblOverview.text =  movie.overview
        self.lblUserScrore.text =  movie.voteAverage?.description
    }
    
    private func setStyles(){
        self.lblTitle.subtitlePrimary()
        self.lblDate.labelRegularWhite()
        self.titleOverview.subtitleWhite()
        self.lblOverview.labelRegularWhite()
        self.titleUserscore.subtitleWhite()
        self.lblUserScrore.subtitlePrimary()
        self.titleCast.subtitle()
    }
    
    
    private func setupBinding(){
        self.castCollectionView.register(UINib(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: "castCell"))
        
        
        viewModel.loading.subscribe(onNext: { (isLoader) in
            isLoader ? self.loaderCast.startAnimating() : self.loaderCast.stopAnimating()
        }).disposed(by: disposeBag)
        
        
        viewModel.castList.bind(to: castCollectionView.rx.items(cellIdentifier: "castCell", cellType: CastCollectionViewCell.self)) {  (row,cast,cell) in
            
            cell.lblCharacter.text = cast.character
            cell.lblName.text = cast.name
            
            guard let profilePath = cast.profilePath else {
                cell.photo.image = UIImage(named: "avatar")
                return
            }
            
            let urlImage = "\(pathImages)\(profilePath)"
            cell.photo.kf.setImage(with: URL(string: urlImage))
            
        }.disposed(by: disposeBag)
        
        
        viewModel.genreString.subscribe(onNext: { (list) in
            print(list)
        }).disposed(by: disposeBag)
    }
}
