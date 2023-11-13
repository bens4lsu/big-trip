//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-13.
//

import Foundation
import Plot
import Publish
import Files
import Ink
import Yams

extension PublishingContext where Site == Bigtrip {
    
    var videos: [Video] {
        let path =  self.site.path(for: .posts).parent + "VideoYaml"
        let decoder = YAMLDecoder()
        var videos = [Video]()
        do {
            try Folder(path: path).files.enumerated().forEach { (index, file) in
                //print (file)
                let fileYaml = try file.readAsString()
                var decoded = try decoder.decode(VideoAlbum.self, from: fileYaml)
                //print ("video gallery \(decoded.id): \(decoded.videos.count) videos")
                let preFilterCount = decoded.videos.count
                decoded.videos = decoded.videos.filter {
                    $0.embed.count > 0
                }
                if decoded.videos.count != preFilterCount {
                    print ("WARNING: videos eliminated because no emded code in \(file.name)")
                }
                if decoded.videos.count > 0 {
                    videos += decoded.videos
                }
            }
        } catch(let e) {
            print ("Video album file or decode error on:  \(e)")
        }
        return videos
    }
    
    var posts: [BlogPost] {
        guard let blog2Section = self.sections.filter({ $0.id == .posts }).first
        else {
            return []
        }
        let blogPosts = blog2Section.items.map { item in
            let slug = URL(string: item.path.string)?.lastPathComponent ?? item.path.string
            return BlogPost(title: item.title, slug: slug, date: item.date, content: item.content.body, description: item.metadata.description, tags: item.tags)
        }.sorted(by: { $0.date < $1.date })
        return blogPosts
    }
    
    var everything: [Component] {
        let mystuff: [Component] = videos + posts
        print(mystuff)
        return mystuff
    }
}
