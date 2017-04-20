//
//  CardTableViewCell.swift
//  TUM Campus App
//
//  Created by Mathias Quintero on 12/6/15.
//  Copyright © 2015 LS1 TUM. All rights reserved.
//

import UIKit
import FoldingCell

class CardTableViewCell: FoldingCell {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//        self.foregroundView.layer.cornerRadius = 8
//        self.foregroundView.layer.masksToBounds = true
//        self.containerView.layer.cornerRadius = 8
//        self.containerView.layer.masksToBounds = true
    }
    
    func setElement(_ element: DataElement) {
        
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
    
}
