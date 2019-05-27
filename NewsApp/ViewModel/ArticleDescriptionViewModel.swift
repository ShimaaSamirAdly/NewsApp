//
//  ArticleDescriptionViewModel.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/27/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import Foundation

class ArticleDescriptionViewModel {
    
    var articleDescription = ""
    
    init(articleDescription: String) {
        self.articleDescription = articleDescription
    }
    
    func getArticleDesc() -> String {
        return articleDescription
    }
}
