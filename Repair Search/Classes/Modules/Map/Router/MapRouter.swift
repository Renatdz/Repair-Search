//
//  MapRouter.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

class MapRouter {
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
    
}

extension MapRouter: MapWireframe {
    
    static func assembleModule(with window: UIWindow) {
        let storyboard     = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(MapViewController.self)
        
        let presenter = MapPresenter()
        let router    = MapRouter()
        
        presenter.router         = router
        viewController.presenter = presenter
        
        router.viewController = viewController
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func presentListModule() {
        let listModule    = ListRouter.assembleModule()
        let navListModule = UINavigationController(rootViewController: listModule)
        
        viewController?.present(navListModule, animated: true, completion: nil)
    }
    
}
