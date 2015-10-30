//
//  PostLink.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/19.
//
//

import Foundation
import AEXML

public struct PostLink: PostProtocol {
    
    public let id: String?
    public let url: NSURL?
    public let urlWithSlug: NSURL?
    public let type: String?
    public let date: NSDate?
    public let format: String?
    public let reblogKey: String?
    public let slug: String?
    
    public let linkText: String?
    public let linkURL: NSURL?
    public let linkDescription: String?
    public let tags: [String]?
    
    public init?(postXml: AEXMLElement?) {
        guard let postXml = postXml else { return nil }
                
        id = postXml.attributes["id"]
        url = NSURL(nullableString: postXml.attributes["url"])
        urlWithSlug = NSURL(nullableString: postXml.attributes["url-with-slug"])
        type = postXml.attributes["type"]
        date = NSDate.parse(postXml.attributes["date-gmt"])
        format = postXml.attributes["format"]
        reblogKey = postXml.attributes["reblog-key"]
        slug = postXml.attributes["slug"]
        linkText = postXml["link-text"].stringValue
        linkURL = NSURL(string: postXml["link-url"].stringValue)
        linkDescription = postXml["link-description"].stringValue
        tags = postXml.sameElementStrings("tag")
    }

}

extension PostLink: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var properties = ["id:\(id)", "url:\(url)", "urlWithSlug:\(urlWithSlug)", "type:\(type)", "date:\(date)", "format:\(format)", "reblogKey:\(reblogKey)", "slug:\(slug)", "link-text:\(linkText)", "link-url:\(linkURL)", "link-description:\(linkDescription)"]
        if let tags = tags {
            properties = tags.reduce([String](), combine: { (pros, tag) -> [String] in pros + ["tag:\(tag)"] })
        }
        return properties.joinWithSeparator("\n")
    }
    
}