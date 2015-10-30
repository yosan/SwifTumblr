//
//  PostConversationLine.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/20.
//
//

import Foundation
import AEXML

public struct PostConversationLine {
 
    public let name: String?
    public let label: String?
    public let line: String?
    
    public init?(lineXml: AEXMLElement?) {
        guard let lineXml = lineXml else { return nil }

        name = lineXml.attributes["name"]
        label = lineXml.attributes["label"]
        line = lineXml.stringValue
    }
    
}

extension PostConversationLine: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        let properties = ["name:\(name)", "label:\(label)", "line:\(line)"]
        return properties.joinWithSeparator("\n")
    }

}

