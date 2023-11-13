//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-13.
//

import Foundation
import Plot
import Publish

extension PublishingStep where Site == Bigtrip {
    
    static func writePostPages() -> Self {
        .step(named: "Mirror Pages") { context in
            
        }
    }
}
