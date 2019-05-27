//
//  NewsClient.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import Foundation
import Alamofire

class NewsClient {

    static let sharedManager = NewsClient()
    
    let apiKey = "e991749d19b64815a80e53b694a3df89"
    
    private init() {
        
    }
    
    //calling api to get list of news
    func getPopularNews(country: String, page: Int, completion: @escaping ([ArticleModel], Int, String?) -> Void) {
       
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(apiKey)&page=\(page)&pageSize=10")
        
        Alamofire.request(url!).responseJSON { (response) in
            print("response is \(response)")
            guard response.result.isSuccess else {
                print("in errorrr")
                completion([], 0, "Error is \(response.error?.localizedDescription))")
                return
            }
            
            guard let data = response.data else {
                print("Error in data")
                completion([], 0, "Error in data")
                return
            }
            
            do{
                let newsResponse = try JSONDecoder().decode(NewsResponseModel.self, from: data) as NewsResponseModel
                if newsResponse.status == "ok" {
                    completion(newsResponse.articles ?? [], newsResponse.totalResults ?? 0, nil)
                    
                }else {
                    let errorResponse = try JSONDecoder().decode(ErrorModel.self, from: data) as ErrorModel

                    completion([], 0, errorResponse.message)
                }
            } catch {
                
                completion([], 0, "\(error)")
                print(error)
            }
            
        }
    }
    
}
