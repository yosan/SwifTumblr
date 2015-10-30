// https://github.com/Quick/Quick

import Quick
import Nimble
import SwifTumblr

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will fail") {
            
            describe("fetching blog test") {
                
                it("can fetch blog") {
                    var b: Blog?
                    
                    SwifTumblr.getBlog(
                        URLString: "http://karaocket.tumblr.com/api/read/",
                        success: { blog in
                            b = blog
                            debugPrint(b?.posts)
                        },
                        failure: { error in
                            debugPrint(error)
                        }
                    )
                    
                    expect(b?.title).toEventually(equal("Karaocket"))
                }
                
            }
            

//            it("can do maths") {
//                expect(1) == 2
//            }
//
//            it("can read") {
//                expect("number") == "string"
//            }
//
//            it("will eventually fail") {
//                expect("time").toEventually( equal("done") )
//            }
//            
//            context("these will pass") {
//
//                it("can do maths") {
//                    expect(23) == 23
//                }
//
//                it("can read") {
//                    expect("🐮") == "🐮"
//                }
//
//                it("will eventually pass") {
//                    var time = "passing"
//
//                    dispatch_async(dispatch_get_main_queue()) {
//                        time = "done"
//                    }
//
//                    waitUntil { done in
//                        NSThread.sleepForTimeInterval(0.5)
//                        expect(time) == "done"
//
//                        done()
//                    }
//                }
//            }
        }
    }
}
