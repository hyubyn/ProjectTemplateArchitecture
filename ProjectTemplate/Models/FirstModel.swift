//
//  FirstModel.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstModel {
    var by = ""
    var descendants = 0
    var id = 0
    var kids = [Int]()
    var score = 0
    var time: Int64 = 0
    var title = ""
    var type = ""
    var url = ""
    
    init() {}
    
    init(json: JSON) {
        if let byValue = json["by"].string {
            by = byValue
        }
        if let descendantsValue = json["descendants"].int {
            descendants = descendantsValue
        }
        if let idValue = json["id"].int {
            id = idValue
        }
        if let kidsValue = json["kids"].arrayObject {
            kids = kidsValue as! [Int]
        }
        if let scoreValue = json["score"].int {
            score = scoreValue
        }
        if let timeValue = json["time"].int64 {
            time = timeValue
        }
        if let titleValue = json["title"].string {
            title = titleValue
        }
        if let typeValue = json["type"].string {
            type = typeValue
        }
        if let urlValue = json["url"].string {
            url = urlValue
        }
    }
}
