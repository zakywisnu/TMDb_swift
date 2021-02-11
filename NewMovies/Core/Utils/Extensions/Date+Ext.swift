//
//  Date+Ext.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 08/02/21.
//

import Foundation
extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
