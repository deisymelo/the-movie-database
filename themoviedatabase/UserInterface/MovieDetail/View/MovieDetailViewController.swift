//
//  MovieDetailViewController.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet var imgBackdrop: UIImageView!
    @IBOutlet var imgPoster: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblOverview: UILabel!
    @IBOutlet var titleOverview: UILabel!
    
    @IBOutlet var lblUserScrore: UILabel!
    @IBOutlet var titleUserscore: UILabel!
    var movie:Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationItem.title = self.movie?.title ?? "Movie Detail"
        setStyles()
        
        guard let movie = self.movie else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
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
    }
}
