//
//  ListInteractor.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

class ListInteractor {
    
    // MARK: - Properties
    
    weak var output: ListInteractorOutput?
    var placesAPIManager: PlacesAPIManageable!
    
    init() {
        placesAPIManager = PlacesAPIManager()
    }
    
}

extension ListInteractor: ListUseCase {
    
    func fetchListContent(lat: Double, lng: Double, radius: Double) {
        placesAPIManager.fetchWorkshops(lat: lat, lng: lng, radius: radius) {
            workshops in
            
            guard workshops != nil else {
                self.output?.listContentFetchFailed(); return
            }
            
            self.output?.listContentFetched(workshops!)
        }
    }
    
}

