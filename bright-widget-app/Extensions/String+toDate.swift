//
//  String+toDate.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/8/24.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self)
    }
}
