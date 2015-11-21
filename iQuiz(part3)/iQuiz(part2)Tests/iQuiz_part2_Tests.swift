//
//  iQuiz_part2_Tests.swift
//  iQuiz(part2)Tests
//
//  Created by seowoosuk on 11/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import XCTest
@testable import iQuiz_part2_

class iQuiz_part2_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

//
// For iQuiz Test3 
//
func testdownloadTask() {
    let didFinishExpectation = expectationWithDescription("download finished")
    let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    let URL = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")
    let request = NSMutableURLRequest(URL:URL!)
    request.HTTPMethod = "GET"
    
    let quizzes = [AnyObject]
    let task = session.dataTaskWithRequest(request) { (data,response, error) -> Void in
        XCTAssertNotNil(data, "data should not be nil")
        XCTAssertNil(error,"error should be nil")
        let statusCode = (response as! NSHTTPURLResponse).statusCode
        
        print("URL Task Worked: \(statusCode)")
        
        
        do {
            quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            
            didFinishExpectation.fulfill()
        } catch {
            //report an error
        }

    }
    task.resume()
    
    self.waitForExpectationsWithTimeout(5.0, handler:nil)
    
    XCTAssertEqual(quizzes.count, 3)
}