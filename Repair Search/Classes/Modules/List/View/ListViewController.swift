//
//  ListViewController.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import CoreLocation

class ListViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var presenter: ListPresentation!
    var coordinates: CLLocationCoordinate2D!
    var workshops: [Workshop]! = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Oficinas"
        
        let rightButton = UIBarButtonItem(image: ICN_NAV_CLOSE,
                                          style: .plain,
                                          target: self,
                                          action: #selector(didTouchOnCloseButton))
        self.navigationItem.setRightBarButton(rightButton, animated: true)
        
        presenter.viewDidLoad(coordinates)
    }
    
    // MARK: Actions
    
    @objc func didTouchOnCloseButton() {
        presenter.didTouchOnCloseAction()
    }
    
}

extension ListViewController: ListInterface {
    
    func showListContent(_ workshops: [Workshop]) {
        let (start, end) = (self.workshops.count, workshops.count + self.workshops.count)
        let indexPaths = (start..<end).map { return IndexPath(row: $0, section: 0) }
        
        self.workshops.append(contentsOf: workshops)
        
        collectionView.performBatchUpdates({ () -> Void in
            collectionView.insertItems(at: indexPaths)
        }, completion: nil)
    }
    
    func showNoContentView() {
        
    }
    
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workshops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as WorkshopCell
        cell.setup(with: workshops[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelect(workshop: workshops[indexPath.row])
    }
    
}
