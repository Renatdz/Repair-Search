//
//  MapContract.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import CoreLocation

protocol MapInterface: class {
    var presenter: MapPresentation! { get set }
    
    func showNoContentView()
    func showMapContent(_ workshops: [Workshop])
}

protocol MapPresentation: class {
    weak var interface: MapInterface? { get set }
    var router: MapWireframe!         { get set }
    var interactor: MapUseCase!       { get set }
    var workshops: [Workshop]!        { get set }
    
    func didRefreshCoordinates(_ coordinates: CLLocationCoordinate2D)
    func didTouchOnListAction(_ coordinates: CLLocationCoordinate2D)
}

protocol MapUseCase: class {
    weak var output: MapInteractorOutput?     { get set }
    var placesAPIManager: PlacesAPIManageable! { get set }
    
    func fetchMapContent(lat: Double, lng: Double, radius: Double)
}

protocol MapInteractorOutput: class {
    func mapContentFetched(_ workshops: [Workshop])
    func mapContentFetchFailed()
}

protocol MapWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule(with window: UIWindow)
    func presentListModule(_ coordinates: CLLocationCoordinate2D)
}
