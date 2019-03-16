//
//  MovieDetailViewController.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/16/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie:Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationItem.title = self.movie?.title ?? "Movie Detail"

        // Do any additional setup after loading the view.
    }
}
