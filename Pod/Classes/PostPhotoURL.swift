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
    
    public let photoURL: NSURL?
    public let maxWidth: Int?
    
    public init?(photoUrlXml: AEXMLElement?) {
        guard let photoUrlXml = photoUrlXml else { return nil }
        photoURL = NSURL(string: photoUrlXml.stringValue)
        maxWidth = Int(nullableString: photoUrlXml.attributes["max-width"])
    }
    
}

extension PostPhotoURL: CustomDebugStringConvertible {
 
    public var debugDescription: String {
        let properties = ["photoURL:\(photoURL)", "max-width:\(maxWidth)"]
        return properties.joinWithSeparator("\n")
    }

}