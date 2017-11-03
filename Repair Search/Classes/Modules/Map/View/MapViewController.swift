//
//  MapViewController.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

class MapViewController: BaseViewController {
    
    // MARK: - Outlets
    

    
    // MARK: - Properties
    
    var presenter: MapPresentation!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func didTouchOnListButton(_ sender: Any) {
        presenter.didTouchOnListAction()
    }
    
}

extension MapViewController: MapInterface {
    
}
