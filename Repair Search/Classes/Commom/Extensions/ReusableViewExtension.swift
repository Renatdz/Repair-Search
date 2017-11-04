//
//  ReusableViewExtension.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

extension ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
