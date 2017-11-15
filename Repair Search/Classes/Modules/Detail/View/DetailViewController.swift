//
//  DetailViewController.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var noContentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties

    var presenter: DetailPresentation!
    var style: PresentStyle!
    var workshop: Workshop!
    var heights: [CGFloat]! = []
    var wasFetched: Bool!   = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = workshop.name
        
        if style == .present {
            let rightButton = UIBarButtonItem(image: ICN_NAV_CLOSE,
                                              style: .plain,
                                              target: self,
                                              action: #selector(didTouchOnCloseButton))
            self.navigationItem.setRightBarButton(rightButton, animated: true)
        }
        
        presenter.viewDidLoad(id: workshop.placeId)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.invalidateLayout()
        }
    }
    
    // MARK: Actions
    
    @IBAction func didTouchOnTryAgainButton(_ sender: Any) {
        self.view.sendSubview(toBack: noContentView)
    
        presenter.didTouchOnTryAgainAction(id: workshop.placeId)
    }
    
    @objc func didTouchOnCloseButton() {
        presenter.didTouchOnCloseAction()
    }

}

extension DetailViewController: DetailInterface {
    
    func showDetailContent(_ workshop: Workshop) {
        let (start, end) = (self.workshop.reviews.count, workshop.reviews.count + self.workshop.reviews.count)
        let indexPaths = (start..<end).map { return IndexPath(row: $0, section: 0) }
        
        self.workshop   = workshop
        
        for review in self.workshop!.reviews {
            let height = SizingCell.review(with: review)
            heights.append(height)
        }
        
        wasFetched = true
        
        collectionView.performBatchUpdates({ () -> Void in
            collectionView.insertItems(at: indexPaths)
        }, completion: { _ in
            self.collectionView.reloadSections(IndexSet(0...0))
        })
    }
    
    func showNoContentView() {
        self.view.bringSubview(toFront: noContentView)
    }
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workshop.reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header = WorkshopHeader()
        
        if kind == UICollectionElementKindSectionHeader {
            header = collectionView.dequeueReusableView(of: kind, for: indexPath) as WorkshopHeader
            header.setup(with: workshop, wasDataFetched: wasFetched)
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(for: indexPath) as ReviewCell
        cell.setup(workshop.reviews[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = heights[indexPath.item]
        
        return CGSize(width: collectionView.bounds.size.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let review = workshop.reviews[indexPath.item]
        
        if let url = URL(string: review.authorUrl) {
            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }
    }
    
}

extension DetailViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

