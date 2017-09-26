//
//  PostQuote.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/19.
//
//

import Foundation
import AEXML

public struct PostQuote: PostProtocol {
    
    public let id: String?
    public let url: URL?
    public let urlWithSlug: URL?
    public let type: String?
    public let date: Date?
    public let format: String?
    public let reblogKey: String?
    public let slug: String?
    
    let quoteText: String?
    let quoteSource: String?
    let tags: [String]?
    
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
        quoteText = postXml["quote-text"].string
        quoteSource = postXml["quote-source"].string
        tags = postXml.sameElementStrings("tag")
    }
    
}

extension PostQuote: CustomDebugStringConvertible {
 
    public var debugDescription: String {
        var properties = ["id:\(String(describing: id))", "url:\(String(describing: url))", "urlWithSlug:\(String(describing: urlWithSlug))", "type:\(String(describing: type))", "date:\(String(describing: date))", "format:\(String(describing: format))", "reblogKey:\(String(describing: reblogKey))", "slug:\(String(describing: slug))", "quote-text:\(String(describing: quoteText))", "quote-source:\(String(describing: quoteSource))"]
        if let tags = tags {
            properties = tags.reduce([String](), { (pros, tag) -> [String] in pros + ["tag:\(tag)"] })
        }
        return properties.joined(separator: "\n")
    }

}
