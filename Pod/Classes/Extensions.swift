//
//  Extensions.swift
//  Pods
//
//  Created by Takahashi Yosuke on 2015/10/20.
//
//

import Foundation
import AEXML

internal extension NSDate {
    
    class func parse(dateString: String?) -> NSDate? {
        guard let dateString = dateString else { return nil }
        
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss' 'xxx"
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        let d = formatter.dateFromString(dateString)
        return NSDate(timeInterval: 0, sinceDate: d!)
    }
    
}

internal extension AEXMLElement {
    
    func sameElementStrings(elementName: String) -> [String]? {
        return self[elementName].all?.map({ xml in xml.stringValue })
    }
    
}

internal extension NSURL {
    
    convenience init?(nullableString: String?) {
        guard let urlString = nullableString else { return nil }
        self.init(string: urlString)
    }
    
}

internal extension Int {
    
    init?(nullableString: String?) {
        guard let intString = nullableString else { return nil }
        self.init(intString)
    }
    
}