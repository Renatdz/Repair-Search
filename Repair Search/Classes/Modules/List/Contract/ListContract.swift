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
}

protocol ListPresentation: class {
    var router: ListWireframe! { get set }
    
    func viewDidLoad()
}

protocol ListWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule(with coordinates: CLLocationCoordinate2D) -> UIViewController
    func presentDetailModule()
}
