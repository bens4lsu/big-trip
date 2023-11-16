//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-13.
//

import Foundation
import Plot
import Publish

extension EnvironmentKey where Value == DateFormatter {
    static let defaultDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter
    }()
    
    static let yyyyMMddDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

extension EnvironmentKey where Value == Int {
    static let maxArticlesHomePage = 6
    
    static let styleAndScriptVersion = Int.random(in: Int.min...Int.max)
}
