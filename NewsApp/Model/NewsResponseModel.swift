//
//  NewsResponseModel.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import Foundation

class NewsResponseModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [ArticleModel]?
}
