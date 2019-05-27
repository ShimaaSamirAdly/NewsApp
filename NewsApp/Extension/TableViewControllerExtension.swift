//
//  ViewControllerExtension.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UITableViewController: NVActivityIndicatorViewable {
    
    //show loader for network operation
    func showLoader() {
        let size = CGSize(width: 40, height: 40)
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor(red: 6/255, green: 90/255, blue: 114/255, alpha: 1)
        startAnimating(size, message: nil, type: NVActivityIndicatorType.ballClipRotateMultiple)
    }
    
    
    //hide loader from screen
    func hideLoader() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
}
