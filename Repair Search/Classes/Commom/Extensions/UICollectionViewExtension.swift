//
//  UICollectionView+Register.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        let nib = UINib(nibName: T.NibName, bundle: Bundle.main)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerView<T: UICollectionViewCell>(_: T.Type, for supplementaryView: String) {
        let nib = UINib(nibName: T.NibName, bundle: Bundle.main)
        register(nib, forSupplementaryViewOfKind: supplementaryView, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableView<T: UICollectionViewCell>(of kind: String, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.reuseIdentifier)")
        }
        
        return view
    }
    
}
