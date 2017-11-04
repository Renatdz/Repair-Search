//
//  NibLoadableViewExtension.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

extension NibLoadableView where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
    
}
