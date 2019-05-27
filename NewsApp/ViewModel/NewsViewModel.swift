//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    var articles: [ArticleModel] = []
    var countryCode = ""
    var delegate: MainProtocol?
    var page = 1
    var totalResults = 0
    var isAvailableCountryCode: Bool = true
    var isConnected = true
    
    func getNoOfCells() -> Int {
        return articles.count
    }
    
    func getImageUrl(index: Int) -> String {
        return articles[index].urlToImage ?? ""
    }
    
    func getArticleTitle(index: Int) -> String {
        return articles[index].title ?? "--"
    }
    
    func getAuthorName(index: Int) -> String {
        return articles[index].author ?? "--"
    }
    
    func getArticleDescription(index: Int) -> String {
        return articles[index].articleDescription ?? ""
    }
    
    
    func hasMoreData() -> Bool {
        return articles.count < totalResults
    }
    
    
    //check for internet connection before calling api
    func getArticles() {
        if NWConnectivity.sharedInstance.isConnectedToInternet(){
            self.isConnected = true
            callGetNewsAPI {
                self.delegate?.succefullyFetchData()
            }
        }else {
            NWConnectivity.sharedInstance.startListening {
                
                self.isConnected = true
                self.callGetNewsAPI {
                    self.delegate?.succefullyFetchData()
                }
            }
            ToastAlertView.showToastMessage(text: "No Internet Connection!")
            if articles.count == 0 {
                self.articles = ArticleCachingManager.shared.getAllArticles()
            }
            self.isConnected = false
            self.delegate?.succefullyFetchData()
        }
    }
    
    
    //get the countryCode of user
    func setCountryCode() {
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String, isAvailableCountryCode {
            self.countryCode = countryCode.lowercased()
//                        self.countryCode = "mm"
        }else {
            self.countryCode = "us"
        }
    }
    
    //start calling api to get data
    private func callGetNewsAPI(completion: @escaping ()->()) {
        
        setCountryCode()
        
        self.delegate?.startLoading()

        NewsClient.sharedManager.getPopularNews(country: countryCode, page: page) { (articles, totalResults, errorMsg) in
            self.delegate?.stopLoading()
            if errorMsg == nil {
                if totalResults == 0 {
                    self.isAvailableCountryCode = false
                    self.getArticles()

                }else {
                    if self.page == 1 {
                        self.articles = articles
                        if articles.count > 5 {
                            ArticleCachingManager.shared.addArticles(articles: Array(self.articles.prefix(5)))
                        }else {
                            ArticleCachingManager.shared.addArticles(articles: self.articles)
                        }
                    }else {
                        self.articles.append(contentsOf: articles)
                    }
                    self.totalResults = totalResults
                
                    completion()
                }
            }else {
                ToastAlertView.showToastMessage(text: errorMsg!)
            }
        
        }
    }
}
