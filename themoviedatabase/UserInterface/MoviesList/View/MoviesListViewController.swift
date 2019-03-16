//
//  ViewController.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/15/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class MoviesListViewController: UIViewController {

    @IBOutlet var moviesCollectionView: UICollectionView!
    @IBOutlet var loader: UIActivityIndicatorView!
    
    let disposeBag = DisposeBag()
    var viewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: "cellMovie"))
        
        setupBinding()
        viewModel.getMoviesList()
    }

    
    func setupBinding(){
       
        viewModel.loading.subscribe(onNext: { (isLoader) in
                isLoader ? self.loader.startAnimating() : self.loader.stopAnimating()
        }).disposed(by: disposeBag)
 
        
        viewModel.moviesList.bind(to: moviesCollectionView.rx.items(cellIdentifier: "cellMovie", cellType: MovieCollectionViewCell.self)) {  (row,movie,cell) in
            let urlImage = "\(pathImages)\(movie.posterPath!)"
            cell.image.kf.setImage(with: URL(string: urlImage))
        }.disposed(by: disposeBag)
        

        
    }
}

