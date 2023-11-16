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
    
    static func writeVideoPages() -> Self {
        .step(named: "Write Video Pages") { context in
            for video in context.videos {
                let pageComponent = PageTemplate(bodyContent: video)
                var page = Page(path: "\(video.link)", content: Content())
                let html = HTML(.component(pageComponent))
                page.content.body.html = html.render()
                context.addPage(page)
            }
        }
    }
}
