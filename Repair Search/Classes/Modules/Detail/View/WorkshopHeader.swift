//
//  WorkshopHeader.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import GoogleMaps
import Cosmos

class WorkshopHeader: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var viw_minimalInformation: UIView!
    @IBOutlet weak var viw_reviews: UIView!
    
    @IBOutlet weak var gmp_mapView: GMSMapView!
    @IBOutlet weak var cmv_workshopRating: CosmosView!
    @IBOutlet weak var lbl_isWorkshopOpen: UILabel!
    @IBOutlet weak var btn_workshopCallNow: UIButton!
    @IBOutlet weak var lbl_workshopPhone: UILabel!
    @IBOutlet weak var lbl_workshopSite: UILabel!
    @IBOutlet weak var lbl_workshopAddress: UILabel!
    
    // MARK: - Lifecycle
    
    var workshop: Workshop!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Fix the target of callNow
        self.contentView.addSubview(viw_minimalInformation)
    }
    
    // MARK: - Setups
    
    func setup(with workshop: Workshop, wasDataFetched: Bool) {
        self.workshop = workshop
        
        guard wasDataFetched else {
            setupMinimumInformationView()
            setupGeneralInformationView(wasDataFetched)
            return
        }
        
        setupMapView()
        
        setupMinimumInformationView()
        
        setupGeneralInformationView(wasDataFetched)
        
        if self.workshop.reviews.count > 0 {
            viw_reviews.isHidden = false
        }
    }
    
    func setupMapView() {
        let coordinates = CLLocationCoordinate2D(latitude: workshop.latitude, longitude: workshop.longitude)
        
        gmp_mapView.camera = GMSCameraPosition.camera(withTarget: coordinates, zoom: 16)
        
        let marker = GMSMarker()
        marker.position         = coordinates
        marker.appearAnimation  = .pop
        marker.icon             = ICN_MAP_CAR
        marker.title            = workshop.name
        marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        marker.map              = gmp_mapView
        marker.userData         = workshop
    }
    
    func setupMinimumInformationView() {
        cmv_workshopRating.rating = workshop.rating

        if workshop.isOpenNow == true {
            lbl_isWorkshopOpen.text = "Aberto"
            lbl_isWorkshopOpen.textColor = UIColor.green
        }
        
        if workshop.phone != nil {
            btn_workshopCallNow.isEnabled = true
        }
    }
    
    func setupGeneralInformationView(_ wasDataFetched: Bool) {
        guard wasDataFetched else { return }
        
        let hasPhone   = workshop.phone   != nil ? workshop.phone   : "Não informado"
        let hasSite    = workshop.website != nil ? workshop.website : "Não informado"
        let hasAddress = workshop.address != nil ? workshop.address : "Não informado"
        
        lbl_workshopPhone.text   = hasPhone
        lbl_workshopSite.text    = hasSite
        lbl_workshopAddress.text = hasAddress
    }
    
    
    // MARK - Actions
    
    @IBAction func callNow(_ sender: Any) {
        let formatedNumber = workshop.phone.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
        let phoneUrl = "tel://\(formatedNumber)"
        
        guard let url = URL(string: phoneUrl) else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
