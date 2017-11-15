//
//  MapInteractor.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

class MapInteractor {
    
    // MARK: - Properties
    
    weak var output: MapInteractorOutput?
    var placesAPIManager: PlacesAPIManageable!
    
    init() {
        placesAPIManager = PlacesAPIManager()
    }
    
}

extension MapInteractor: MapUseCase {
    
    func fetchMapContent(lat: Double, lng: Double, radius: Double) {
        placesAPIManager.fetchWorkshops(lat: lat, lng: lng, radius: radius) {
            workshops in
            
            guard workshops != nil else {
                self.output?.mapContentFetchFailed(); return
            }
            
            self.output?.mapContentFetched(workshops!)
        }
    }
    
}
