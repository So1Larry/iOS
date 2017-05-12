//
//  FachschaftRSS.swift
//  TUM Campus App
//
//  Created by Tim Gymnich on 12.05.17.
//  Copyright © 2017 LS1 TUM. All rights reserved.
//

import Foundation


class FachschaftRSS: DataElement {
    let title: String
    let details: String

    
    init(title: String, details: String) {
        self.title = title
        self.details = details
    }
    
    func getCellIdentifier() -> String {
        return "fachschaft"
    }
    
    var text: String {
        return title
    }

}
