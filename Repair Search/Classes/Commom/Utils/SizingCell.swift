//
//  SizingCell.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import UIKit

class SizingCell {
    
    static func review(with review: Review) -> CGFloat {
        var height: CGFloat = 73 // 73 é origin y do textView
        
        let text = review.text as NSString
        
        let size = CGSize(width: UIScreen.main.bounds.width - 42, height: CGFloat(Float.infinity)) // 42 são as margens (left & right) do textView da view
        let font = UIFont(name: "Arial", size: 14)
        
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font!], context: nil)
        
        height = height + trunc(rect.height) + 6
        
        height = height + 15 // 15 é a margem bottom do text view para a célula
        
        return height
    }
    
}
