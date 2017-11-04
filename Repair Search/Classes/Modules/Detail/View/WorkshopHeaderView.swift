//
//  EstablishmentHeaderView.swift
//  GoogleWebServices_CarRepair
//
//  Created by Renato Mendes on 29/11/16.
//  Copyright © 2016 Renato Mendes. All rights reserved.
//

import UIKit
import GoogleMaps
import Cosmos
import GSKStretchyHeaderView

class WorkshopHeaderView: GSKStretchyHeaderView {

    @IBOutlet weak var gmView: GMSMapView!
    
    @IBOutlet weak var minimumInformationView: UIView! {
        didSet {
            minimumInformationView.layer.addBorder(edge: .bottom, color: UIColor.lightGray, thickness: 0.5)
        }
    }
    @IBOutlet weak var establishmentRating: CosmosView!
    @IBOutlet weak var establishmentIsOpen: UILabel!
    @IBOutlet weak var establishmentCallNow: UIButton!
    
    @IBOutlet weak var generalInformationView: UIView!
    @IBOutlet weak var establishmentPhone: UILabel!
    @IBOutlet weak var establishmentSite: UILabel!
    @IBOutlet weak var establishmentAddress: UILabel!
    
    
    var workshop: Workshop!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setHeader(with workshop: Workshop) {
        
        self.workshop = workshop
        
        // Set map
        self.createMapView()
        
        // Set minimum information
        self.createMinimumInformationView()
        
        // Set general information
        self.createGeneralInformationView()
    }
    
    func createMapView() {
        var coordinates = CLLocationCoordinate2D()
        coordinates.latitude  = self.workshop.latitude
        coordinates.longitude = self.workshop.longitude
        
        self.gmView.camera = GMSCameraPosition.camera(withTarget: coordinates, zoom: 16)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(self.workshop.latitude, self.workshop.longitude)
        marker.appearAnimation = .pop
        marker.icon = UIImage(named:"icon_map_car")
        marker.title = workshop.name
        marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        marker.map = self.gmView
        marker.userData = workshop
    }
    
    func createMinimumInformationView() {
        // Estabelece a avaliação por estrelas
        self.establishmentRating.rating = self.workshop.rating

        // Verifica se o estabelecimento está aberto
        if self.workshop.openNow == true {
            self.establishmentIsOpen.text = "Aberto"
            self.establishmentIsOpen.textColor = UIColor.green
        }
        
        // Verifica se existe número
        if self.workshop.phone != nil {
            self.establishmentCallNow.isEnabled = true
        }
    }
    
    func createGeneralInformationView() {
        // Verifica se os valores existem
        let hasPhone   = self.workshop.phone != nil ? self.workshop.phone : "Não informado"
        let hasSite    = self.workshop.website != nil ? self.workshop.website : "Não informado"
        let hasAddress = self.workshop.address != nil ? self.workshop.address : "Não informado"
        
        // Insere valores
        self.establishmentPhone.text   = hasPhone
        self.establishmentSite.text    = hasSite
        self.establishmentAddress.text = hasAddress
    }
    
    
    // MARK - Actions
    
    @IBAction func callNow(_ sender: Any) {
        let formatedNumber = self.workshop.phone.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
        let phoneUrl = "tel://\(formatedNumber)"
        let url = URL(string: phoneUrl)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
