//
//  DetailInteractor.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

class DetailInteractor {
    
    // MAR: - Properties
    
    weak var output: DetailInteractorOutput?
    var placesAPIManager: PlacesAPIManageable!
    
    init() {
        placesAPIManager = PlacesAPIManager()
    }
    
}

extension DetailInteractor: DetailUseCase {
    
    func fetchDetailContent(id: String) {
        placesAPIManager.fetchWorkshop(id: id) {
            workshop in
            
            guard workshop != nil else {
                self.output?.detailContentFetchFailed(); return
            }
            
            self.output?.detailContentFetched(workshop!)
        }
    }
    
}
