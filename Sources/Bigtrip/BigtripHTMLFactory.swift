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
        let htmlHeadInfo = HeaderInfo(location: context.index, title: "bigtrip.sailvelvetelvis.com")
        let pageMain = PageTemplate(bodyContent: context.homePageItems)

        return HTML(
            htmlHeadInfo.node,
            .body(.component(pageMain))
        )
    }
    
    func makePageHTML(for page: Publish.Page, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML {
        let htmlHeadInfo = HeaderInfo(location: context.index, title: "bigtrip.sailvelvetelvis.com")
        var thisPageBody = page.body.convertToNode(withContext: HTML.DocumentContext.self)
        if page.path == "all" {
            let templatedBody = PageTemplate(bodyContent: context.allPageItems)
            thisPageBody = .component(templatedBody)
        }
        return HTML(
            htmlHeadInfo.node,
            thisPageBody
        )
    }



    func makeSectionHTML(for section: Publish.Section<Bigtrip>, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML {
        return HTML("hello section")
    }
    
    func makeItemHTML(for item: Publish.Item<Bigtrip>, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML {
        let htmlHeadInfo = HeaderInfo(location: context.index, title: item.title)
        let blogPost = BlogPost(title: item.title, slug: item.path.string, date: item.date, content: item.body, description: item.description, tags: item.tags)
        let pageMain = PageTemplate(bodyContent: blogPost)
        return HTML(htmlHeadInfo.node, pageMain.convertToNode())
        
    }
    

    
    func makeTagListHTML(for page: Publish.TagListPage, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML? {
        return HTML("hello tags")
    }
    
    func makeTagDetailsHTML(for page: Publish.TagDetailsPage, context: Publish.PublishingContext<Bigtrip>) throws -> Plot.HTML? {
        return HTML("hello tag details")
    }
    
    
    
    


}
