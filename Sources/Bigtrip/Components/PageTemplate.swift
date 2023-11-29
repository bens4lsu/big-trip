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
    let currentYear = Calendar.current.component(.year, from: Date())
    
    var bodyHeader: Component {
        Header {
            Div {
                Image("/img/bigtrip/velvetelvis.png")
            }
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
    
    var bodyFooter: Component {
        Footer {
            Navigation {
                List {
                    ListItem {
                        Link("Home", url:"/")
                    }
                }
            }
            Div {
                Paragraph {
                    Text("© 2023 - \(currentYear) ")
                    Link("sailvelvetelvis.com", url: "https://sailvelvetelvis.com")
                }
                Paragraph {
                    Text("Generated using ")
                    Link("Publish", url: "https://github.com/johnsundell/publish")
                    Text(".  Written in Swift.")
                }
            }
        }
    }
    
    var body: Component {
        ComponentGroup {
            bodyHeader
            bodyContent
            bodyFooter
        }
    }
}
