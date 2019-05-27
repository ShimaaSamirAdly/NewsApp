//
//  ArticleDescriptionViewController.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/26/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import UIKit

class ArticleDescriptionViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: ArticleDescriptionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.layer.cornerRadius = 20
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        descriptionLabel.text = viewModel?.getArticleDesc()

    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
