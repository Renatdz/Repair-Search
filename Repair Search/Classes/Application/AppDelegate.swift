//
//  AppDelegate.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?

}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Set Google providers
        GMSServices.provideAPIKey(GM_API_KEY)
        GMSPlacesClient.provideAPIKey(GM_API_KEY)
        
        // Set initial viewController
        window = UIWindow()
        MapRouter.assembleModule(with: window!)
        
        return true
    }
    
}

