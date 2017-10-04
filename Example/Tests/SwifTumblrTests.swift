//
//  SwifTumblrTests.swift
//  SwifTumblr_Tests
//
//  Created by Takahashi Yosuke on 2017/10/04.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import XCTest
import SwifTumblr

class SwifTumblrTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetBlog() {
        
        let expect = expectation(description: "getBlog")
        
        var blog: Blog?
        
        SwifTumblr.getBlog(
            URLString: "http://ysn-blog.tumblr.com/api/read",
            success: { b in
                blog = b
                expect.fulfill() },
            failure: { _ in XCTFail() })
        
        wait(for: [expect], timeout: 5.0)
        
        XCTAssertNotNil(blog?.posts)
        XCTAssertGreaterThan(blog!.posts!.count, 0)
    }
}
