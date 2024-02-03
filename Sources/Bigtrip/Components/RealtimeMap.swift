//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-16.
//

import Foundation
import Plot
import Publish

struct RealtimeMap: Component {
    
    var body: Component {
        Div  {
            H2("Tracking")
            Paragraph("Placeholder for real-time tracking.  Some lines are on the map from previous voyages of a previous Velvet Elvis.")
            Paragraph{
                Text("If you have trouble navigating the map in this frame")
                Link("go directly to the page", url: EnvironmentKey.predictWindSrc)
                Text(".")
            }
            IFrame(url: EnvironmentKey.predictWindSrc, addBorder: true, allowFullScreen: true, enabledFeatureNames: []).class("iframe-tracking")
        }.class("wrapper")
    }
}
