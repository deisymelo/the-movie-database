//
//  UIViewController.swift
//  themoviedatabase
//
//  Created by Deisy Melo on 3/17/19.
//  Copyright © 2019 deisymelo. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    func showAlertWithMessage(title:String, msn:String){
        let alert = UIAlertController(title: title, message: msn, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
