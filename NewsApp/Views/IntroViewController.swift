//
//  IntroViewController.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var appName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appName.alpha = 0
        UIView.animate(withDuration: 3) {
            self.appName.alpha = 1
        }
        
        perform(#selector(navigateToNext), with: nil, afterDelay: 3)
        
    }
    

    @objc func navigateToNext() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newsListTableViewController = storyBoard.instantiateViewController(withIdentifier: "newsList") as! UINavigationController
        self.present(newsListTableViewController, animated: true, completion: nil)
    }
}
