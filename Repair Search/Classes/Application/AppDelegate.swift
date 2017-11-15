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
import AlamofireNetworkActivityIndicator

@UIApplicationMain
class AppDelegate: UIResponder {

    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: - Setups
    
    func setupActivityNetwork() {
        NetworkActivityIndicatorManager.shared.isEnabled       = true
        NetworkActivityIndicatorManager.shared.startDelay      = 0.2
        NetworkActivityIndicatorManager.shared.completionDelay = 0.2
    }
    
    func setupNavBar() {
        UINavigationBar.appearance().backIndicatorImage = ICN_NAV_BACK
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = ICN_NAV_BACK
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-160, 0), for: .default)
    }
    
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Set Google providers
        GMSServices.provideAPIKey(GM_API_KEY)
        GMSPlacesClient.provideAPIKey(GM_API_KEY)
        
        setupActivityNetwork()
        
        setupNavBar()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        MapRouter.assembleModule(with: window!)
        
        return true
    }
    
}

