//
//  ReviewCell.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class ReviewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var img_authorImg: UIImageView!
    @IBOutlet weak var lbl_authorName: UILabel!
    @IBOutlet weak var cmv_review: CosmosView!
    @IBOutlet weak var txv_comment: UITextView! {
        didSet {
            txv_comment.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    @IBOutlet weak var lbl_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ review: Review) {
        lbl_authorName.text = review.authorName
        cmv_review.rating   = review.rating
        lbl_date.text       = FormatDate.formatDateToString(date: review.time) 
        
        txv_comment.text = (review.text == nil) ? "" : review.text
        
        guard review.imgURL != nil else {
            return
        }
        
        if let url = URL(string: review.imgURL) {
            img_authorImg.sd_setImage(with: url, placeholderImage: UIImage(named: "icon_default_profile"), options: .refreshCached)
        }
    }
    
}
