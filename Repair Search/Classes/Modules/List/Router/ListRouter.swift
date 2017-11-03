//
//  ListRouter.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import CoreLocation

class ListRouter {
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
    
}

extension ListRouter: ListWireframe {
    
    static func assembleModule(with coordinates: CLLocationCoordinate2D) -> UIViewController {
        let storyboard     = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(ListViewController.self)
        
        let presenter = ListPresenter()
        let router    = ListRouter()
        
        presenter.router         = router
        
        viewController.presenter   = presenter
        viewController.coordinates = coordinates
        
        router.viewController = viewController
        
        return viewController
    }
    
    func presentDetailModule() {
        
    }
    
}
