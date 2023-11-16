//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-16.
//

import Foundation
import Plot
import Publish

struct ArticleList: Component {
    
    let items: [AnyComparableDatedComponent]
    
    var body: Component {
        Div {
            List(items) { item in
                item.previewBox
            }.listStyle(.unordered).class("item-list")
        }.class("wrapper")
    }
    
    var homePage: Component {
        ComponentGroup {
            Div("The Schultz family is picking up a new boat in January, 2024 and bringing it from Izola, Slovenia in the Adriatic Sea back to her new home in New Orleans.  Follow along with the adventure!").class("wrapper")
            RealtimeMap()
            self
        }
    }
}


