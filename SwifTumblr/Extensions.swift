//
//  Extensions.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/20.
//
//

import Foundation
import AEXML

internal extension Date {
    
    static func parse(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss' 'xxx"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let d = formatter.date(from: dateString)
        return Date(timeInterval: 0, since: d!)
    }
    
}

internal extension AEXMLElement {
    
    func sameElementStrings(_ elementName: String) -> [String]? {
        return self[elementName].all?.map({ xml in xml.string })
    }
    
}
