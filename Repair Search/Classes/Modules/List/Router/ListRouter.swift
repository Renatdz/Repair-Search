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
        
        let presenter  = ListPresenter()
        let interactor = ListInteractor()
        let router     = ListRouter()
        
        presenter.interactor = interactor
        presenter.router     = router
        presenter.interface  = viewController
        
        viewController.presenter   = presenter
        viewController.coordinates = coordinates
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return viewController
    }
    
    func presentDetailModule(workshop: Workshop) {
        let detailModule = DetailRouter.assembleModule(with: workshop, style: .push)
        viewController?.navigationController?.pushViewController(detailModule, animated: true)
    }
    
    func closeListModule() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}
