//
//  FachschaftNews.swift
//  TUM Campus App
//
//  Created by Tim Gymnich on 12.05.17.
//  Copyright © 2017 LS1 TUM. All rights reserved.
//

import UIKit

class FachschaftNewsCardTableViewCell: CardTableViewCell {
    
    @IBOutlet weak var cardView: UIView! {
        didSet {
            backgroundColor = UIColor.clear
            cardView.layer.shadowOpacity = 0.4
            cardView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        }
    }
    
    override func setElement(_ element: DataElement) {
        if let news = element as? FachschaftRSS {
            print(news)
        }
    }
    
}
