//
//  NewsCachingManager.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import Foundation
import RealmSwift

class ArticleCachingManager {
    
    static let shared = ArticleCachingManager()
    let realm = try! Realm()
    
    private init(){
        
    }
    
    //add articles Array to realm database
    func addArticles(articles: [ArticleModel]) {
        deleteAllArticles()
        try! realm.write {
            realm.add(articles, update: true)
        }
    }
    
    
    //delete all articles objects from realm database
    func deleteAllArticles() {
        let articlesResult: Results<ArticleModel> = realm.objects(ArticleModel.self)
        try! realm.write {
            realm.delete(articlesResult)
        }
    }
    
    //get all articles object from realm database
    func getAllArticles() -> [ArticleModel] {
        let articlesResult = realm.objects(ArticleModel.self)
        return Array(articlesResult)
    }

}
