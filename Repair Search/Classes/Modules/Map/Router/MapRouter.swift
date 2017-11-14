//
//  MapRouter.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import CoreLocation

class MapRouter {
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
    
}

extension MapRouter: MapWireframe {
    
    static func assembleModule(with window: UIWindow) {
        let storyboard     = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(MapViewController.self)
        
        let presenter  = MapPresenter()
        let interactor = MapInteractor()
        let router     = MapRouter()
        
        presenter.interactor = interactor
        presenter.router     = router
        presenter.interface  = viewController
        
        viewController.presenter = presenter
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        window.rootViewController = viewController
    }
    
    func presentListModule(_ coordinates: CLLocationCoordinate2D) {
        let listModule    = ListRouter.assembleModule(with: coordinates)
        let navListModule = UINavigationController(rootViewController: listModule)
        
        viewController?.present(navListModule, animated: true, completion: nil)
    }
    
}
