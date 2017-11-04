//
//  UIStoryboardExtension.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(_: T.Type) -> T {
        guard let vc = instantiateViewController(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not load view with identifier: \(T.reuseIdentifier)")
        }
        
        return vc
    }
    
}
