//
//  BaseViewController.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension BaseViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        navigationController.navigationBar.barStyle                 = .black
        navigationController.navigationBar.barTintColor             = NAV_COLOR
        navigationController.navigationBar.tintColor                = WHITE_COLOR
        navigationController.navigationBar.titleTextAttributes      = NAV_TEXT_ATT
        navigationController.navigationBar.largeTitleTextAttributes = NAV_TEXT_ATT
        navigationController.navigationBar.prefersLargeTitles       = true
        navigationController.navigationBar.isTranslucent            = false
        navigationController.navigationBar.shadowImage              = UIImage()
    }
    
}
