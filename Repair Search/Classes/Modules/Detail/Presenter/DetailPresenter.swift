//
//  DetailPresenter.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

class DetailPresenter {
    
    // MARK: - Properties
    
    weak var interface: DetailInterface?
    var router: DetailWireframe!
    var interactor: DetailUseCase!

}

extension DetailPresenter: DetailPresentation {
    
    func viewDidLoad(id: String) {
        interactor.fetchDetailContent(id: id)
    }
    
    func didTouchOnCloseAction() {
        router.closeDetailModule()
    }
    
}

extension DetailPresenter: DetailInteractorOutput {
    
    func detailContentFetched(_ workshop: Workshop) {
        interface?.showDetailContent(workshop)
    }
    
    func detailContentFetchFailed() {
        interface?.showNoContentView()
    }
    
}
