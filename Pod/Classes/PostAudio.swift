//
//  PostAudio.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/20.
//
//

import Foundation
import AEXML

public struct PostAudio: PostProtocol {
 
    public let id: String?
    public let url: URL?
    public let urlWithSlug: URL?
    public let type: String?
    public let date: Date?
    public let format: String?
    public let reblogKey: String?
    public let slug: String?
    
    public let audioCaption: String?
    public let audioPlayer: String?
    public let audioEnbed: String?
    public let id3Title: String?
    public let tags: [String]?
    
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
        audioCaption = postXml["audio-caption"].string
        audioPlayer = postXml["audio-player"].string
        audioEnbed = postXml["audio-enbed"].string
        id3Title = postXml["id3-title"].string
        tags = postXml.sameElementStrings("tag")
    }
    
}

extension PostAudio: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var properties = ["id:\(id)", "url:\(url)", "urlWithSlug:\(urlWithSlug)", "type:\(type)", "date:\(date)", "format:\(format)", "reblogKey:\(reblogKey)", "slug:\(slug)", "audio-caption:\(audioCaption)", "audio-player:\(audioPlayer)", "audio-enbed:\(audioEnbed)", "id3-title:\(id3Title)"]
        if let tags = tags {
            properties = tags.reduce([String](), { (pros, tag) -> [String] in pros + ["tag:\(tag)"] })
        }
        return properties.joined(separator: "\n")
    }
    
}
