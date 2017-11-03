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
}

protocol MapPresentation: class {
    var router: MapWireframe! { get set }
    
    func viewDidLoad()
    func didTouchOnListAction(_ coordinates: CLLocationCoordinate2D)
}

protocol MapWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule(with window: UIWindow)
    func presentListModule(_ coordinates: CLLocationCoordinate2D)
}
