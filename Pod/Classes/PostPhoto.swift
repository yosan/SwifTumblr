//
//  PostPhoto.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/19.
//
//

import Foundation
import AEXML

public struct PostPhoto: PostProtocol {
 
    public let id: String?
    public let url: NSURL?
    public let urlWithSlug: NSURL?
    public let type: String?
    public let date: NSDate?
    public let format: String?
    public let reblogKey: String?
    public let slug: String?
    
    public let photoCaption: String?
    public let photoLinkURL: NSURL?
    public let photoURLs: [PostPhotoURL]?
    
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
        photoCaption = postXml["photo-caption"].stringValue
        photoLinkURL = NSURL(nullableString: postXml["photo-link-url"].stringValue)
        photoURLs = postXml["photo-url"].all?.flatMap({ PostPhotoURL(photoUrlXml: $0) })
    }
    
}

extension PostPhoto: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var properties = ["id:\(id)", "url:\(url)", "urlWithSlug:\(urlWithSlug)", "type:\(type)", "date:\(date)", "format:\(format)", "reblogKey:\(reblogKey)", "slug:\(slug)", "photo-caption:\(photoCaption)", "photo-link-url:\(photoLinkURL)"]
        if let photoURLs = photoURLs {
            properties = photoURLs.reduce([String](), combine: { (pros, photoURL) -> [String] in pros + ["photo-url:\(photoURL)"] })
        }
        return properties.joinWithSeparator("\n")
    }
    
}