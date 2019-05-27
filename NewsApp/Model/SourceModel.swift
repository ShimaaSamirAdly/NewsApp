//
//  SourceModel.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers class SourceModel: Object, Codable {
    dynamic var id: String?
    dynamic var name: String?
   
}

