//
//  PostConversation.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/20.
//
//

import Foundation
import AEXML

public struct PostConversation: PostProtocol {
    
    public let id: String?
    public let url: URL?
    public let urlWithSlug: URL?
    public let type: String?
    public let date: Date?
    public let format: String?
    public let reblogKey: String?
    public let slug: String?
    
    public let conversationText: String?
    public let conversationLines: [PostConversationLine]?
    
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
        conversationText = postXml["conversation-text"].string
        conversationLines = postXml["conversation"]["line"].all?.flatMap { PostConversationLine(lineXml: $0) }
    }
    
}

extension PostConversation: CustomDebugStringConvertible {
 
    public var debugDescription: String {
        var properties = ["id:\(id)", "url:\(url)", "urlWithSlug:\(urlWithSlug)", "type:\(type)", "date:\(date)", "format:\(format)", "reblogKey:\(reblogKey)", "slug:\(slug)", "conversation-text:\(conversationText)"]
        if let conversationLines = conversationLines {
            properties = conversationLines.reduce([String](), { (pros, line) -> [String] in pros + ["line:\(line)"] })
        }
        return properties.joined(separator: "\n")
    }
    
}
