//
//  Blog.swift
//  SingItLater
//
//  Created by Takahashi Yosuke on 2015/08/12.
//  Copyright (c) 2015年 Yousan. All rights reserved.
//

import Foundation
import AEXML

public struct Blog {
    
    public let name: String?
    public let timezone: String?
    public let title: String?
    public let description: String?
    public let posts: Posts?
    
    public init(xmlDoc: AEXMLDocument) {        
        let blogElem = xmlDoc.root["tumblelog"]
        self.name = blogElem.attributes["name"]
        self.timezone = blogElem.attributes["timezone"]
        self.title = blogElem.attributes["title"]
        self.description = blogElem.stringValue
        self.posts = Posts(postsXml: xmlDoc.root["posts"])
    }
    
}

extension Blog: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        let properties = ["name:\(name)", "timezone:\(timezone)", "title:\(title)", "description:\(description)", "posts:\(posts)"]
        return properties.joinWithSeparator("\n")
    }
    
}