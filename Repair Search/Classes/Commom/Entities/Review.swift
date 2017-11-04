//
//  Review.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import Foundation

struct Review {
    
    var authorName : String!
    var authorUrl  : String!
    var rating     : Double!
    var text       : String!
    var imgURL     : String!
    var time       : Date!
    
    init() {
        authorName = nil
        authorUrl  = nil
        rating     = nil
        text       = nil
        imgURL     = nil
        time       = nil
    }
    
    init(_ dict: NSDictionary) {
        self.init()
        
        if let authorName = dict["author_name"] as? String {
            self.authorName = authorName
        }
        
        if let authorUrl = dict["author_url"] as? String {
            self.authorUrl = authorUrl
        }
        
        if let rating = dict["rating"] as? Double {
            self.rating = rating
        }
        
        if let text = dict["text"] as? String {
            self.text = text
        }
        
        if let imgURL = dict["profile_photo_url"] as? String {
            self.imgURL = imgURL
        }
        
        if let time = dict["time"] as? NSNumber {
            self.time = Date(timeIntervalSince1970: TimeInterval(truncating: time))
        }
    }
    
}
