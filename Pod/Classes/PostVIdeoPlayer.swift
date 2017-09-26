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
        
        player = playerXml.string
        maxWidth = playerXml.attributes["max-width"].flatMap { Int($0) }
    }
    
}

extension PostVideoPlayer: CustomDebugStringConvertible {
  
    public var debugDescription: String {
        let properties = ["player:\(String(describing: player))", "max-width:\(String(describing: maxWidth))"]
        return properties.joined(separator: "\n")
    }
    
}
