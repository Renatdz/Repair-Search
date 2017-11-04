//
//  ListPresenter.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import CoreLocation

class ListPresenter {
    
    // MARK: - Properties
    
    weak var interface: ListInterface?
    var router: ListWireframe!
    var interactor: ListUseCase!
    
    var workshops: [Workshop]! = [] {
        didSet {
            if workshops.count > 0 {
                interface?.showListContent(workshops)
            } else {
                interface?.showNoContentView()
            }
        }
    }
    
}

extension ListPresenter: ListPresentation {
    
    func viewDidLoad(_ coordinates: CLLocationCoordinate2D) {
        interactor.fetchListContent(lat: coordinates.latitude, lng: coordinates.longitude, radius: 500)
    }
    
    func didSelect(workshop: Workshop) {
        router.presentDetailModule(workshop: workshop)
    }
    
    func didTouchOnCloseAction() {
        router.closeListModule()
    }
    
}

extension ListPresenter: ListInteractorOutput {
    
    func listContentFetched(_ workshops: [Workshop]) {
        self.workshops = workshops
    }
    
    func listContentFetchFailed() {
        interface?.showNoContentView()
    }
    
}
