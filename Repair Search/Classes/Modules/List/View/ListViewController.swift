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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigationBar
        setupNavBar(.list)
        
        print(coordinates)
    }
    
    // MARK: - Setups
    
    override func setupNavBar(_ type: NavType) {
        super.setupNavBar(type)
        
        self.title = "Oficinas"
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
}

extension ListViewController: ListInterface {
    
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as WorkshopCell
        //cell.setup(with: <#T##Establishment#>)
        
        return cell
    }
    
}
