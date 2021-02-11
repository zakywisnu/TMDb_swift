//
//  String+Ext.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 08/02/21.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}
