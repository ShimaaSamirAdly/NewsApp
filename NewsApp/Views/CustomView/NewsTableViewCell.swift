//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImg: UIImageView!
    
    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var articleDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
