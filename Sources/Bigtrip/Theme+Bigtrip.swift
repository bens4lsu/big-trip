//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-14.
//

import Foundation
import Foundation
import Publish

extension Theme where Site == Bigtrip {
    static var bigtripTheme: Theme {
        Theme(htmlFactory: BigtripHTMLFactory(), resourcePaths: ["Resources/style/style.css"])
    }
}
