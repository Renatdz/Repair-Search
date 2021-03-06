//
//  Workshop.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import Foundation

struct Workshop {
    
    var id        : String!
    var placeId   : String!
    var name      : String!
    var icon      : String!
    var isOpenNow : Bool!
    var latitude  : Double!
    var longitude : Double!
    var vicinity  : String!
    var address   : String!
    var phone     : String!
    var rating    : Double!
    var url       : String!
    var website   : String!
    var reviews   : [Review]!
    
    init() {
        id        = nil
        placeId   = nil
        name      = nil
        icon      = nil
        isOpenNow = false
        latitude  = nil
        longitude = nil
        vicinity  = nil
        address   = nil
        phone     = nil
        rating    = 0
        url       = nil
        website   = nil
        reviews   = [Review]()
    }
    
    init(_ dict: NSDictionary) {
        self.init()
        
        if let id = dict["id"] as? String {
            self.id = id
        }
        
        if let placeId = dict["place_id"] as? String {
            self.placeId = placeId
        }
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        
        if let icon = dict["icon"] as? String {
            self.icon = icon
        }
        
        if let openingHours = dict["opening_hours"] as? NSDictionary {
            if let isOpenNow = openingHours["open_now"] as? Bool {
                self.isOpenNow = isOpenNow
            }
        }
        
        if let geometry = dict["geometry"] as? NSDictionary {
            if let location = geometry["location"] as? NSDictionary {
                if let latitude = location["lat"] as? Double {
                    self.latitude = latitude
                }
                
                if let longitude = location["lng"] as? Double {
                    self.longitude = longitude
                }
            }
        }
        
        if let vicinity = dict["vicinity"] as? String {
            self.vicinity = vicinity
        }
        
        if let address = dict["formatted_address"] as? String {
            self.address = address
        }
        
        if let phone = dict["formatted_phone_number"] as? String {
            self.phone = phone
        }
        
        if let rating = dict["rating"] as? Double {
            self.rating = rating
        }
        
        if let url = dict["url"] as? String {
            self.url = url
        }
        
        if let website = dict["website"] as? String {
            self.website = website
        }
        
        if let arr = dict["reviews"] as? NSArray {
            for dict in arr {
                self.reviews.append(Review(dict as! NSDictionary))
            }
        }
    }

    
}
