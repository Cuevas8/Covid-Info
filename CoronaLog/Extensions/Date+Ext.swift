//
//  Date+Ext.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/15/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

extension Date {
    func convertToAPIDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
