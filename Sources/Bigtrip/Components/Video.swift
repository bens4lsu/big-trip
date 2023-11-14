//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-13.
//

import Foundation
import Plot
import Publish

struct Video: DatedComponent, Decodable {
    let id: Int
    let name: String
    let dateRecorded: Date
    let caption: String
    let url: String
    let embed: String
    let tn: String
    let duration: TimeInterval
    
    var date: Date { dateRecorded }
    
    var formattedDate: String {
        EnvironmentKey.defaultDateFormatter.string(from: dateRecorded)
    }
    
    var formattedDuration: String {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        if duration >= 3600 {
            formatter.allowedUnits = [.hour, .minute, .second];
        } else {
            formatter.allowedUnits = [.minute, .second];
        }
        guard let durationString = formatter.string(from: duration)
        else {
            return ""
        }
        return "Duration:  \(durationString)"
    }
    
    var autoSlug: String {
        let pattern = "[^A-Za-z0-9\\-]+"
        return name.replacingOccurrences(of: " ", with: "-")
            .replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
            .lowercased()
    }
    
    var link: String { "/video/\(autoSlug)" }
    
    var dateRecordedString: String {
        "Recorded:  " + EnvironmentKey.defaultDateFormatter.string(from: dateRecorded)
    }
    
    // for line items on pages on /video-albums
    var body: Component {
        Div {
            Div {
                H2 { Link(name, url: link) }
                Span(Markdown(caption))
                H3 { Text("\(dateRecordedString)") }
                H3 { Text("\(formattedDuration)") }
            }.class("vid-gal-stuff")
            Div{
                Link(url: link) {
                    Image("/img/video-thumbnails/\(tn)")
                }
            }.class("vid-gal-thumbnail")
        }.class("vid-gal-line-item")
    }
    
    var previewBox: Component {
        Article {
            H1 { Link(name, url: link) }
            Paragraph(caption)
        }
    }
}

extension Video: Comparable {
    static func < (lhs: Video, rhs: Video) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: Video, rhs: Video) -> Bool {
        lhs.id == rhs.id
    }
}
