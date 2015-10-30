//
//  PostVideoPlayer.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/20.
//
//

import Foundation
import AEXML

public struct PostVideoPlayer {
    
    public let player: String?
    public let maxWidth: Int?
    
    public init?(playerXml: AEXMLElement?) {
        guard let playerXml = playerXml else { return nil }
        
        player = playerXml.stringValue
        maxWidth = Int(nullableString: playerXml.attributes["max-width"])
    }
    
}

extension PostVideoPlayer: CustomDebugStringConvertible {
  
    public var debugDescription: String {
        let properties = ["player:\(player)", "max-width:\(maxWidth)"]
        return properties.joinWithSeparator("\n")
    }
    
}