//
//  ToastAlertView.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import UIKit
import SwiftyDrop

class ToastAlertView {
    
    //show animated view at top of screen to show message to user
    static func showToastMessage(text: String) {
        DispatchQueue.main.async {
            let alertColor: UIColor = UIColor.lightGray
            Drop.down(text, state: .color(alertColor))
        }
    }
}
