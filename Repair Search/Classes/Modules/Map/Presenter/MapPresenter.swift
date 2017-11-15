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
    
    weak var interface: MapInterface?
    var router: MapWireframe!
    var interactor: MapUseCase!
    
    var workshops: [Workshop]! = [] {
        didSet {
            if workshops.count > 0 {
                interface?.showMapContent(workshops)
            } else {
                interface?.showNoContentView()
            }
        }
    }
    
}

extension MapPresenter: MapPresentation {
    
    func didRefreshCoordinates(_ coordinates: CLLocationCoordinate2D) {
        interactor.fetchMapContent(lat: coordinates.latitude, lng: coordinates.longitude, radius: 500)
    }
    
    func didTouchOnListAction(_ coordinates: CLLocationCoordinate2D) {
        router.presentListModule(coordinates)
    }
    
    func didTapOnMarkerAction(_ workshop: Workshop) {
        router.presentDetailModule(workshop)
    }
    
}

extension MapPresenter: MapInteractorOutput {
 
    func mapContentFetched(_ workshops: [Workshop]) {
        self.workshops = workshops
    }
    
    func mapContentFetchFailed() {
        interface?.showNoContentView()
    }
    
}
