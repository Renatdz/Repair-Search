//
//  DetailContract.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

protocol DetailInterface: class {
    var presenter: DetailPresentation! { get set }
    var style: PresentStyle!           { get set }
    var workshop: Workshop!            { get set }
    var heights: [CGFloat]!            { get set }
    
    func showNoContentView()
    func showDetailContent(_ workshop: Workshop)
}

protocol DetailPresentation: class {
    weak var interface: DetailInterface? { get set }
    var router: DetailWireframe!         { get set }
    var interactor: DetailUseCase!       { get set }
    
    func viewDidLoad(id: String)
    func didTouchOnTryAgainAction(id: String)
    func didTouchOnCloseAction()
}

protocol DetailUseCase: class {
    weak var output: DetailInteractorOutput?   { get set }
    var placesAPIManager: PlacesAPIManageable! { get set }
    
    func fetchDetailContent(id: String)
}

protocol DetailInteractorOutput: class {
    func detailContentFetched(_ workshop: Workshop)
    func detailContentFetchFailed()
}

protocol DetailWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule(with workshop: Workshop, style: PresentStyle) -> UIViewController
    func closeDetailModule()
}
