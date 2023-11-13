//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-13.
//


import Foundation
import Plot
import Publish

struct VideoAlbum: Component, Decodable {
        
    let id: Int
    let name: String
    let caption: String
    let slug: String
    var videos: [Video]
    let tn: String?
    
    var body: Component {
        EmptyComponent()
    }
    
}
