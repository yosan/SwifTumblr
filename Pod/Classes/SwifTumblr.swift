//
//  SwiftTumblr.swift
//  SingItLater
//
//  Created by Takahashi Yosuke on 2015/08/12.
//  Copyright (c) 2015年 Yousan. All rights reserved.
//

import Foundation
import Alamofire
import AEXML

extension Request {

    public static func BlogResponseSerializer() -> ResponseSerializer<Blog, NSError> {
        return ResponseSerializer { request, response, data, error in
            guard error == nil else { return .Failure(error!) }
            
            guard let validData = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }
            
            do {
                let XML = try AEXMLDocument(xmlData: validData)
                return .Success(Blog(xmlDoc: XML))
            } catch {
                return .Failure(error as NSError)
            }
        }
    }
    
    public func responseBlog(completionHandler: Response<Blog, NSError> -> Void) -> Self {
        return response(responseSerializer: Request.BlogResponseSerializer(), completionHandler: completionHandler)
    }

}

public func getBlog(URLString URLString: URLStringConvertible, success: (Blog) -> Void, failure: (NSError) -> Void) {
    
    Alamofire.request(.GET, URLString)
        .responseBlog { (response: Response<Blog, NSError>) in
            if let blog = response.result.value {
                success(blog)
            } else if let error = response.result.error {
                failure(error)
            }
    }
    
}