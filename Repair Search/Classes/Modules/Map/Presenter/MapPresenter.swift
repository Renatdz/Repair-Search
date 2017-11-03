//
//  MapPresenter.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import CoreLocation

class MapPresenter {
    
    // MARK: - Properties
    
    var router: MapWireframe!
    
}

extension MapPresenter: MapPresentation {
    
    func viewDidLoad() {
        
    }
    
    func didTouchOnListAction(_ coordinates: CLLocationCoordinate2D) {
        router.presentListModule(coordinates)
    }
    
}
