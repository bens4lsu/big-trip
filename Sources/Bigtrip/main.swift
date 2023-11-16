import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Bigtrip: Website {
    enum SectionID: String, WebsiteSectionID {
        case posts
        case video
    }

    struct ItemMetadata: WebsiteItemMetadata {
        var description: String
        var ogImg: String?
    }
    
    struct PostSectionHeading {
        var startDate: Date
        var heading: String
        
        init(_ dateString: String, _ heading: String) {
            let formatter = EnvironmentKey.yyyyMMddDateFormatter
            self.startDate = formatter.date(from: dateString)!
            self.heading = heading
        }
    }
    
    let postSectionHeadings = [
        PostSectionHeading("2023-11-13", "Preparation")
    ]

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "Bigtrip"
    var description = "A description of Bigtrip"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Bigtrip().publish(withTheme: .bigtripTheme, additionalSteps: [
    .writeVideoPages(),
                                                               
])
