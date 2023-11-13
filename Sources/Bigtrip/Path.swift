//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-13.
//

import Foundation
import Publish

extension Path {
    
    var parent: String {
        guard let url = URL(string: self.string) else { return "nil" }
        return url.deletingLastPathComponent().absoluteString
    }
//    
//    var parentPath: Path {
//        Path(parent)
//    }
}
