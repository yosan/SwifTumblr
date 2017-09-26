//
//  PostPhotoURL.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/20.
//
//

import Foundation
import AEXML

public struct PostPhotoURL {
    
    public let photoURL: URL?
    public let maxWidth: Int?
    
    public init?(photoUrlXml: AEXMLElement?) {
        guard let photoUrlXml = photoUrlXml else { return nil }
        photoURL = URL(string: photoUrlXml.string)
        maxWidth = photoUrlXml.attributes["max-width"].flatMap { Int($0) }
    }
    
}

extension PostPhotoURL: CustomDebugStringConvertible {
 
    public var debugDescription: String {
        let properties = ["photoURL:\(String(describing: photoURL))", "max-width:\(String(describing: maxWidth))"]
        return properties.joined(separator: "\n")
    }

}
