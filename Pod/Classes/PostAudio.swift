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
    public let url: NSURL?
    public let urlWithSlug: NSURL?
    public let type: String?
    public let date: NSDate?
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
        url = NSURL(nullableString: postXml.attributes["url"])
        urlWithSlug = NSURL(nullableString: postXml.attributes["url-with-slug"])
        type = postXml.attributes["type"]
        date = NSDate.parse(postXml.attributes["date-gmt"])
        format = postXml.attributes["format"]
        reblogKey = postXml.attributes["reblog-key"]
        slug = postXml.attributes["slug"]
        audioCaption = postXml["audio-caption"].stringValue
        audioPlayer = postXml["audio-player"].stringValue
        audioEnbed = postXml["audio-enbed"].stringValue
        id3Title = postXml["id3-title"].stringValue
        tags = postXml.sameElementStrings("tag")
    }
    
}

extension PostAudio: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var properties = ["id:\(id)", "url:\(url)", "urlWithSlug:\(urlWithSlug)", "type:\(type)", "date:\(date)", "format:\(format)", "reblogKey:\(reblogKey)", "slug:\(slug)", "audio-caption:\(audioCaption)", "audio-player:\(audioPlayer)", "audio-enbed:\(audioEnbed)", "id3-title:\(id3Title)"]
        if let tags = tags {
            properties = tags.reduce([String](), combine: { (pros, tag) -> [String] in pros + ["tag:\(tag)"] })
        }
        return properties.joinWithSeparator("\n")
    }
    
}