//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-13.
//

import Foundation
import Plot
import Publish

struct BlogPost: DatedComponent {
    let title: String
    let slug: String
    let date: Date
    let content: Content.Body
    let description: String
    let tags: [Tag]
    
    
    var dateString: String {
        EnvironmentKey.defaultDateFormatter.string(from: date)
    }
    
    var linkToFull: String {
        "/blog2/\(slug)"
    }
    
    var body: Component {
        return Article {
            H1(title)
            H3(dateString)
            Div(content.body)
        }
    }
    
    var previewBox: Component {
        Article {
            H1 { Link(title, url: "/posts/\(slug)") }
            Paragraph(description)
        }
    }
}

extension BlogPost: Comparable {
    static func == (lhs: BlogPost, rhs: BlogPost) -> Bool {
        lhs.date == rhs.date
    }
    
    static func < (lhs: BlogPost, rhs: BlogPost) -> Bool {
        lhs.date < rhs.date
    }
}

