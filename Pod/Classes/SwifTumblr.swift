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

extension DataRequest {
    
    public static func blogResponseSerializer() -> DataResponseSerializer<Blog> {
        return DataResponseSerializer(serializeResponse: { (request, response, data, error) -> Result<Blog> in
            guard error == nil else { return .failure(error!) }
            
            guard let validData = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = NSError(domain: "jp.yousan.ios.SwifTumblr", code: 100, userInfo: [NSLocalizedFailureReasonErrorKey : failureReason])
                return .failure(error)
            }
            
            do {
                let XML = try AEXMLDocument(xml: validData)
                return .success(Blog(xmlDoc: XML))
            } catch let error {
                return .failure(error)
            }
        })
    }
    
    @discardableResult
    func responseBlog(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Blog>) -> Void) -> Self
    {
        return response(queue: queue, responseSerializer: DataRequest.blogResponseSerializer(), completionHandler: completionHandler)
//        return response(completionHandler: { (response) in
//        })
//        return response(queue: queue, responseSerializer: DataResponse.BlogResponseSerializer(), completionHandler: completionHandler)
    }
    
}

public func getBlog(URLString: URLConvertible, success: @escaping (Blog) -> Void, failure: @escaping (NSError) -> Void) {
    
    Alamofire.request(URLString)
        .responseBlog { (response: DataResponse<Blog>) in
            if let blog = response.result.value {
                success(blog)
            } else if let error = response.result.error {
                failure(error as NSError)
            }
    }
    
}
