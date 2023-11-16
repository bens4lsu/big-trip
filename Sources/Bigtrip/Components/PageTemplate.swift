//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-16.
//

import Foundation
import Plot
import Publish

struct PageTemplate: Component {
    
    let bodyContent: Component
    
    var bodyHeader: Component {
        Header {
            Div {
                Link(url: "/") {
                    H1 {
                        Span("The Big Voyage of the next ")
                        Span("Velvet Elvis").class("italic")
                    }
                }
                Navigation {
                    List {
                        ListItem {
                            Link("Home", url:"/")
                        }
                        ListItem {
                            Link("All Posts In Order", url:"/all")
                        }
                    }
                }
            }.class("wrapper")
        }
    }
    
    var body: Component {
        ComponentGroup {
            bodyHeader
            bodyContent
        }
    }
}
