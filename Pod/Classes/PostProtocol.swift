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
    var url: URL? { get }
    var urlWithSlug: URL? { get }
    var type: String? { get }
    var date: Date? { get }
    var format: String? { get }
    var reblogKey: String? { get }
    var slug: String? { get }
    
    init?(postXml: AEXMLElement?)
    
}
