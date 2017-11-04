//
//  APIManagerProtocols.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

protocol PlacesAPIManageable {
    func fetchWorkshops(lat: Double, lng: Double, radius: Double, complete: @escaping ([Workshop]?) -> (Void))
    func fetchWorkshop(id: String, complete: @escaping (Workshop?) -> (Void))
}

