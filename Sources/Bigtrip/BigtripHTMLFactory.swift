//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-14.
//

//
//  File.swift
//
//
//  Created by Ben Schultz on 5/15/23.
//
import Foundation
import Publish
import Plot

struct BigtripHTMLFactory: HTMLFactory {
    
    typealias Site = Bigtrip
    
    func makeIndexHTML(for index: Publish.Index, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML {
        let indexItems = context.everything
    }
    
    func makeSectionHTML(for section: Publish.Section<Bigtrip>, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML {
        <#code#>
    }
    
    func makeItemHTML(for item: Publish.Item<Bigtrip>, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML {
        <#code#>
    }
    
    func makePageHTML(for page: Publish.Page, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML {
        <#code#>
    }
    
    func makeTagListHTML(for page: Publish.TagListPage, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML? {
        <#code#>
    }
    
    func makeTagDetailsHTML(for page: Publish.TagDetailsPage, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML? {
        <#code#>
    }
    
    
    
    


}
