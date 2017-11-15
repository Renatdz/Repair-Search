//
//  DetailRouter.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import SafariServices

class DetailRouter: NSObject {
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
    
}

extension DetailRouter: DetailWireframe {
    
    static func assembleModule(with workshop: Workshop, style: PresentStyle) -> UIViewController {
        let storyboard     = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(DetailViewController.self)
        
        let presenter  = DetailPresenter()
        let interactor = DetailInteractor()
        let router     = DetailRouter()
        
        presenter.interactor = interactor
        presenter.router     = router
        presenter.interface  = viewController
        
        viewController.presenter = presenter
        viewController.style     = style
        viewController.workshop  = workshop
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return viewController
    }
    
    func presentReviewDetails(review: Review) {
        guard let url = URL(string: review.authorUrl) else { return }
        
        let svc = SFSafariViewController(url: url)
        viewController?.present(svc, animated: true, completion: nil)
    }
    
    func closeDetailModule() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension DetailRouter: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}
