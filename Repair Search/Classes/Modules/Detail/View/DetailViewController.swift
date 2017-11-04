//
//  DetailViewController.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView
import SafariServices

class DetailViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var stretchyHeaderView: WorkshopHeaderView!
    var presenter: DetailPresentation!
    var workshop: Workshop!
    var heights: [CGFloat]! = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigationBar
        setupNavBar(.detail)
        
        // Set header
        setupHeader()
        
        // Call presenter viewDidLoad
        presenter.viewDidLoad(id: workshop.placeId)
    }
    
    // MARK: - Setups
    
    override func setupNavBar(_ type: NavType) {
        super.setupNavBar(type)
        
        self.title = workshop.name
    }
    
    func setupHeader() {
        // Set strech header view
        let headerSize = CGSize(width: collectionView!.frame.size.width, height: 667)
        
        self.stretchyHeaderView = WorkshopHeaderView(frame: CGRect(x: 0, y: 0, width: headerSize.width, height: headerSize.height))
        
        let nibViews: [UIView] = Bundle.main.loadNibNamed("WorkshopHeaderView", owner: self, options: nil) as! [UIView]
        self.stretchyHeaderView = nibViews.first as! WorkshopHeaderView!
        
        self.stretchyHeaderView.setHeader(with: self.workshop)
        
        self.collectionView?.addSubview(self.stretchyHeaderView)
    }
    
}

extension DetailViewController: DetailInterface {
    
    func showDetailContent(_ workshop: Workshop) {
        let (start, end) = (self.workshop.reviews.count, workshop.reviews.count + self.workshop.reviews.count)
        let indexPaths = (start..<end).map { return IndexPath(row: $0, section: 0) }
            
        self.workshop = workshop
        
        for review in self.workshop!.reviews {
            let height = SizingCell.review(with: review)
            heights.append(height)
        }
            
        collectionView.performBatchUpdates({ () -> Void in
            self.collectionView.insertItems(at: indexPaths)
        }, completion: { (finished) -> Void in
            self.stretchyHeaderView.setHeader(with: self.workshop)
        })
    }
    
    func showNoContentView() {
        
    }
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workshop.reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(for: indexPath) as ReviewCell
        cell.setup(workshop.reviews[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let review = workshop.reviews[indexPath.item]
        
        if let url = URL(string: review.authorUrl) {
            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = heights[indexPath.item]
        
        return CGSize(width: collectionView.bounds.size.width, height: height)
    }
    
}

extension DetailViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

