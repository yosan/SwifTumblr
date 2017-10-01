//
//  Posts.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/15.
//
//

import Foundation
import AEXML

public struct Posts {
    
    public let start: Int
    public let total: Int
    
    fileprivate let posts: [PostProtocol]?
    
    public var count: Int {
        guard let posts = posts else { return 0 }
        return posts.count
    }
    
    /**
    Parse XML and create posts object.
    
    - parameter postsXml: posts XML element.
    
    - returns: Posts object. Return nil if some estimated elements don't exist.
    */
    init?(postsXml: AEXMLElement?) {
        if let postsXml = postsXml {
            guard let strStart = postsXml.attributes["start"], let start = Int(strStart) else { return nil }
            guard let strTotal = postsXml.attributes["total"], let total = Int(strTotal) else { return nil }
            
            self.start = start
            self.total = total
            self.posts = Posts.parseEachPosts(postsXml)
        } else {
            return nil
        }
    }
    
    public subscript(index: Int) -> PostProtocol {
        guard let posts = posts , posts.count > index else { fatalError("Out of range") }
        return posts[index]
    }
    
    fileprivate static func parseEachPosts(_ postsXml: AEXMLElement) -> [PostProtocol] {
        var posts = [PostProtocol]()
        for postXml in postsXml.children {
            if let type = postXml.attributes["type"] {
                var post: PostProtocol?
                switch type {
                case "regular":
                    post = PostRegular(postXml: postXml)
                case "link":
                    post = PostLink(postXml: postXml)
                case "quote":
                    post = PostQuote(postXml: postXml)
                case "photo":
                    post = PostPhoto(postXml: postXml)
                case "conversation":
                    post = PostConversation(postXml: postXml)
                case "audio":
                    post = PostAudio(postXml: postXml)
                case "video":
                    post = PostVideo(postXml: postXml)
                case "answer":
                    post = PostAnswer(postXml: postXml)
                default:
                    break
                }
                
                if let post = post {
                    posts.append(post)
                }
            }
        }
        return posts
    }
    
}

extension Posts: CustomDebugStringConvertible {

    public var debugDescription: String {
        var postsDescriptions = ""
        if let posts = posts {
            postsDescriptions += "\n---------------------------\n"
            for post in posts {
                postsDescriptions += post.debugDescription
                postsDescriptions += "\n---------------------------\n"
            }
        }
        let properties = ["start:\(start)", "total:\(total)"]
        return properties.joined(separator: "\n") + postsDescriptions
    }

}
