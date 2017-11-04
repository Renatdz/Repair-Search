//
//  FormatDate.swift
//  Repair Search
//
//  Created by Renato Mendes on 03/11/17.
//  Copyright © 2017 Renato Mendes. All rights reserved.
//

import Foundation
import UIKit

public class FormatDate {
    
    private static let dateFormatter = DateFormatter()
    
    // Formata um timestamp em um Date
    public static func formatTimestampToDate(jsonDate: NSNumber) -> Date {
        if let theDate = Date(jsonDate: "/Date(\(jsonDate.stringValue))/") {
            return theDate
        } else {
            print("wrong format, please, stop your application and do it right")
        }
        
        return Date()
    }
    
    // Formata uma data para uma string
    public static func formatDateToString(date: Date) -> String {
        self.dateFormatter.dateFormat = "dd/MM/yyyy"
        return self.dateFormatter.string(from: date)
    }
    
}
