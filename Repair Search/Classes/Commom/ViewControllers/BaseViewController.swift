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
    }
    
    // MARK: - Setups
    
    func setupNavBar(_ type: NavType) {
        guard let navControl = self.navigationController else {
            return
        }
        
        switch type {
        case .list:
            navControl.navigationBar.prefersLargeTitles = true
        case .detail:
            navControl.navigationBar.prefersLargeTitles = false
        }
    }
    
}
