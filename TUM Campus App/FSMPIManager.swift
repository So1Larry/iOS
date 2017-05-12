//
//  FSMPIManager.swift
//  TUM Campus App
//
//  Created by Tim Gymnich on 12.05.17.
//  Copyright © 2017 LS1 TUM. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash

class FSMPIManager: Manager {
    
    static var faschaftsNews = [DataElement]()
    
    var main: TumDataManager?
    var requiresLogin: Bool {
        return false
    }
    
    required init(mainManager: TumDataManager) {
        main = mainManager
    }
    
    func fetchData(_ handler: @escaping ([DataElement]) -> ()) {
        Alamofire.request(getURL()).responseString() { (response) in
            if let data = response.result.value {
                let parsedXML = SWXMLHash.parse(data)
                let rss = parsedXML["rss"]
                let channel = rss["channel"]
                let items = channel["item"].all
                for item in items {
                    if let title = item["title"].element?.text,
                        let link = item["link"].element?.text,
                        let date = item["pubDate"].element?.text,
                        let content = item["content:encoded"].element?.text?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression).replacingOccurrences(of: "\n", with: " ") {
                        let faschaftRSS = FachschaftRSS(title: title, link: link, date: date, content: content)
                        FSMPIManager.faschaftsNews.append(faschaftRSS)
                    }
                }
            }
        }
    }
    
    func getURL() -> String {
        return "https://mpi.fs.tum.de/feed/"
    }
}
 
