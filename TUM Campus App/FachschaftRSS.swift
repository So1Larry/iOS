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
    let link: String
    let date: String
    let content: String

    
    init(title: String, link: String, date: String, content: String) {
        self.title = title
        self.link = link
        self.date = date
        self.content = content
    }
    
    func getCellIdentifier() -> String {
        return "fachschaft"
    }
    
    var text: String {
        return title
    }

}
