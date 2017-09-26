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
    public let url: URL?
    public let urlWithSlug: URL?
    public let type: String?
    public let date: Date?
    public let format: String?
    public let reblogKey: String?
    public let slug: String?
    
    public let photoCaption: String?
    public let photoLinkURL: URL?
    public let photoURLs: [PostPhotoURL]?
    
    public init?(postXml: AEXMLElement?) {
        guard let postXml = postXml else { return nil }
        
        id = postXml.attributes["id"]
        url = postXml.attributes["url"].flatMap { URL(string: $0) }
        urlWithSlug = postXml.attributes["url-with-slug"].flatMap { URL(string: $0) }
        type = postXml.attributes["type"]
        date = postXml.attributes["date-gmt"].flatMap { Date.parse($0) }
        format = postXml.attributes["format"]
        reblogKey = postXml.attributes["reblog-key"]
        slug = postXml.attributes["slug"]
        photoCaption = postXml["photo-caption"].string
        photoLinkURL = URL(string: postXml["photo-link-url"].string)
        photoURLs = postXml["photo-url"].all?.flatMap { PostPhotoURL(photoUrlXml: $0) }
    }
    
}

extension PostPhoto: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var properties = ["id:\(String(describing: id))", "url:\(String(describing: url))", "urlWithSlug:\(String(describing: urlWithSlug))", "type:\(String(describing: type))", "date:\(String(describing: date))", "format:\(String(describing: format))", "reblogKey:\(String(describing: reblogKey))", "slug:\(String(describing: slug))", "photo-caption:\(String(describing: photoCaption))", "photo-link-url:\(String(describing: photoLinkURL))"]
        if let photoURLs = photoURLs {
            properties = photoURLs.reduce([String](), { (pros, photoURL) -> [String] in pros + ["photo-url:\(photoURL)"] })
        }
        return properties.joined(separator: "\n")
    }
    
}
