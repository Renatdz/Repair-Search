//
//  PlacesAPIManager.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import CoreLocation
import Alamofire
import AlamofireObjectMapper

struct PlacesAPIManager: PlacesAPIManageable {

    // MARK: - API Services
    
    func fetchWorkshops(lat: Double, lng: Double, radius: Double, complete: @escaping ([Workshop]?) -> (Void)) {
        
        var url = "\(BASE_GM_SERVICE)nearbysearch/json?location=\(lat),\(lng)&radius=\(radius)"
        url    += "&types=car_repair&key=\(GM_API_KEY)"
        
        let request = Alamofire.request(url, headers: nil)
        request.validate()
        request.responseJSON() { response in
            
            switch response.result {
            case .success(let json):
                guard let dict = json as? NSDictionary else {
                    complete(nil); return
                }
                complete(self.getWorkshops(array: dict["results"] as! NSArray))
                
            case .failure(let error):
                print(error.localizedDescription)
                complete(nil)
            }
        }
    }
    
    func fetchWorkshop(id: String, complete: @escaping (Workshop?) -> (Void)) {
        
        let url = "\(BASE_GM_SERVICE)details/json?placeid=\(id)&key=\(GM_API_KEY)"
        
        let request = Alamofire.request(url, headers: nil)
        request.validate()
        request.responseJSON() { response in
            
            switch response.result {
            case .success(let json):
                guard let dict = json as? NSDictionary else {
                    complete(nil); return
                }
                let workshop = Workshop(dict["result"] as! NSDictionary)
                complete(workshop)
                
            case .failure(let error):
                print(error.localizedDescription)
                complete(nil)
            }
        }
    }
    // MARK: - Aux Funcs
    
    fileprivate func getWorkshops(array: NSArray) -> [Workshop] {
        var workshops = [Workshop]()
        
        for dict in array {
            workshops.append(Workshop(dict as! NSDictionary))
        }
        
        return workshops
    }
    
}
