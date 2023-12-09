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
    
    static let styleAndScriptVersion = 2  //Int.random(in: Int.min...Int.max)
}

extension EnvironmentKey where Value == String {
    static let predictWindSrc = "https://forecast.predictwind.com/tracking/display/VelvetElvis/?mapMode=useAtlas&windSymbol=OFF&weatherSource=ECMWF&trackDuration=31536000"

}
