//
//  ListContract.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import CoreLocation

protocol ListInterface: class {
    var presenter: ListPresentation!         { get set }
    var coordinates: CLLocationCoordinate2D! { get set }
    var workshops: [Workshop]!               { get set }
    
    func showNoContentView()
    func showListContent(_ workshops: [Workshop])
}

protocol ListPresentation: class {
    weak var interface: ListInterface? { get set }
    var router: ListWireframe!         { get set }
    var interactor: ListUseCase!       { get set }
    var workshops: [Workshop]!         { get set }
    
    func viewDidLoad(_ coordinates: CLLocationCoordinate2D)
    func didSelect(workshop: Workshop)
}

protocol ListUseCase: class {
    weak var output: ListInteractorOutput?     { get set }
    var placesAPIManager: PlacesAPIManageable! { get set }
    
    func fetchListContent(lat: Double, lng: Double, radius: Double)
}

protocol ListInteractorOutput: class {
    func listContentFetched(_ workshops: [Workshop])
    func listContentFetchFailed()
}

protocol ListWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule(with coordinates: CLLocationCoordinate2D) -> UIViewController
    func presentDetailModule(workshop: Workshop)
}
