//
//  PostProtocol.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/19.
//
//

import Foundation
import AEXML

public protocol PostProtocol: CustomDebugStringConvertible {
    
    var id: String? { get }
    var url: NSURL? { get }
    var urlWithSlug: NSURL? { get }
    var type: String? { get }
    var date: NSDate? { get }
    var format: String? { get }
    var reblogKey: String? { get }
    var slug: String? { get }
    
    init?(postXml: AEXMLElement?)
    
}