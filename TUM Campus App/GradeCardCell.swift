//
//  GradeCardCell.swift
//  TUM Campus App
//
//  Created by vagrant on 07/04/2017.
//  Copyright © 2017 LS1 TUM. All rights reserved.
//

import Foundation
import UIKit

class GradeCardCell: CardTableViewCell {

    @IBOutlet weak var SubjectLabel: UILabel!
    @IBOutlet weak var GradeLabel: UILabel!
    
    override func setElement(_ element: DataElement) {
        //print("setting the grade thing..")
        guard let grade = element as? Grade else {
            return
        }

        SubjectLabel.text = grade.name
        GradeLabel.text = grade.result
        
       // print("GradeLabel = \(GradeLabel.text)")
    }
    
    @IBOutlet weak var cardView: UIView! {
        didSet {
            //print("card view being set")
            backgroundColor = UIColor.clear
            cardView.layer.shadowOpacity = 0.4
            cardView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        }
    }
}
