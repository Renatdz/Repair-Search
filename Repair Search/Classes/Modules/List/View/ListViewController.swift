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
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var presenter: ListPresentation!
    var coordinates: CLLocationCoordinate2D!
    var workshops: [Workshop]! = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigationBar
        setupNavBar(.list)
        
        // Call presenter viewDidLoad
        presenter.viewDidLoad(coordinates)
    }
    
    // MARK: - Setups
    
    override func setupNavBar(_ type: NavType) {
        super.setupNavBar(type)
        
        self.title = "Oficinas"
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
}

extension ListViewController: ListInterface {
    
    func showListContent(_ workshops: [Workshop]) {
        let (start, end) = (self.workshops.count, workshops.count + self.workshops.count)
        let indexPaths = (start..<end).map { return IndexPath(row: $0, section: 0) }
        
        self.workshops.append(contentsOf: workshops)
        
        tableView.performBatchUpdates({ () -> Void in
            self.tableView.insertRows(at: indexPaths, with: .automatic)
        }, completion: nil)
    }
    
    func showNoContentView() {
        
    }
    
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workshops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as WorkshopCell
        cell.setup(with: workshops[indexPath.row])
        
        return cell
    }
    
}
