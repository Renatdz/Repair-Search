//
//  MapViewController.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapView: GMSMapView!
    
    // MARK: - Properties
    
    var presenter: MapPresentation!
    var locationManager   = CLLocationManager()
    var coordinates       = CLLocationCoordinate2D()
    var didFindMyLocation = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
    }
    
    // MARK: - Setups
    
    func setupMapView() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.settings.compassButton    = true
        mapView.settings.myLocationButton = true
        
        mapView.addObserver(self, forKeyPath: "myLocation", options: .new, context: nil)
        
        DispatchQueue.main.async {
            self.mapView.isMyLocationEnabled = true
        }
    }
    
    // MARK: - Aux funcs
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    
        if !didFindMyLocation {
            let myLocation = change![NSKeyValueChangeKey.newKey] as! CLLocation
            
            mapView.camera = GMSCameraPosition.camera(withTarget: myLocation.coordinate, zoom: 16)
            mapView.settings.myLocationButton = true
            
            didFindMyLocation = true
            
            coordinates = myLocation.coordinate
            
            presenter.didRefreshCoordinates(coordinates)
        }
    }
    
    func createMark(workshop: Workshop) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(workshop.latitude, workshop.longitude)
        marker.appearAnimation = .pop
        marker.icon = ICN_MAP_CAR
        marker.title = workshop.name
        marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        marker.map = mapView
        marker.userData = workshop
    }
    
    // MARK: - Actions
    
    @IBAction func didTouchOnListButton(_ sender: Any) {
        presenter.didTouchOnListAction(coordinates)
    }
    
}

extension MapViewController: MapInterface {

    func showMapContent(_ workshops: [Workshop]) {
        for workshop in workshops {
            DispatchQueue.main.async {
                self.createMark(workshop: workshop)
            }
        }
    }
    
    func showNoContentView() {
        
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            mapView.isMyLocationEnabled = true
        }
    }
    
}
